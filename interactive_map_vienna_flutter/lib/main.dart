import 'package:interactive_map_vienna_client/interactive_map_vienna_client.dart';
import 'package:flutter/material.dart';
import 'package:interactive_map_vienna_flutter/screens/home.dart';
import 'package:interactive_map_vienna_flutter/services/map_icons.dart';
import 'package:interactive_map_vienna_flutter/services/location_permission_service.dart';
import 'package:interactive_map_vienna_flutter/services/theme.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice instead of
/// using a global client object. This is just a simple example.
late final Client client;

/// Global navigator key for showing dialogs from anywhere in the app
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Preserve the splash screen until the app is ready
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await MapIconsService.preloadIcons();

  // Check and request location permissions automatically on app start
  await _checkLocationPermissionsOnStartup();

  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl = serverUrlFromEnv.isEmpty ? 'http://$localhost:8080/' : serverUrlFromEnv;

  client = Client(serverUrl)..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Remove the splash screen when the app is ready
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hidden Map',
      debugShowCheckedModeBanner: false,
      theme: ThemeService.lightTheme,
      home: const HomeScreen(),
    );
  }
}

/// Check and request location permissions on app startup
Future<void> _checkLocationPermissionsOnStartup() async {
  try {
    // Wait a bit for the app to fully initialize
    await Future.delayed(const Duration(milliseconds: 500));

    // Check if location services are enabled
    final isLocationServiceEnabled = await LocationPermissionService.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      // Location services are disabled, but we won't show a dialog here
      // as the app is still starting up. The user can enable them later.
      return;
    }

    // Check current permission status
    final hasPermission = await LocationPermissionService.hasLocationPermission();
    if (hasPermission) {
      // Permission already granted, nothing to do
      return;
    }

    // Check if permission is permanently denied
    final isPermanentlyDenied = await LocationPermissionService.isLocationPermissionPermanentlyDenied();
    if (isPermanentlyDenied) {
      // Permission permanently denied, user needs to go to settings
      // We'll handle this when they actually try to use location features
      return;
    }

    // Permission not granted but not permanently denied, try to request it silently
    final granted = await LocationPermissionService.requestLocationPermissionSilently();
    if (granted) {
      debugPrint('Location permission granted on startup');
    } else {
      debugPrint('Location permission not granted on startup, will request when needed');
    }
  } catch (e) {
    // Log error but don't crash the app
    debugPrint('Error checking location permissions on startup: $e');
  }
}
