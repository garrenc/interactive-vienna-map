import 'package:flutter/material.dart';
import 'package:interactive_map_vienna_flutter/widgets/frosted_app_bar.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  MapLibreMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // let content go under the bar
      appBar: FrostedAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hidden Map',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover hidden places in Vienna',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Map View'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to about page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to settings page
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to help page
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MapLibreMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: const LatLng(48.2082, 16.3738),
                zoom: 17, // High detail zoom
              ),
              styleString: 'https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json',
              rotateGesturesEnabled: true,
              trackCameraPosition: true,
              compassEnabled: false,
              // Enable built-in location features
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.tracking, // Start with none, then enable tracking
              // Enable all gestures for maximum user control
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              doubleClickZoomEnabled: true,
              // Customize attribution button
              attributionButtonPosition: AttributionButtonPosition.topRight,
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.rotate(
        angle: 5.5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.7),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: _centerOnLocation,
            icon: const Icon(
              Icons.navigation,
              color: Colors.white, // Use white color for visibility
            ),
          ),
        ),
      ),
    );
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
    // Wait a bit for location to be available, then center on user
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _centerOnLocation();
      }
    });
  }

  void _centerOnLocation() {
    if (_mapController != null) {
      // Enable location tracking and center on user
      _mapController!.updateMyLocationTrackingMode(MyLocationTrackingMode.tracking);
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
