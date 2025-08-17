import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class LocationPermissionService {
  static const String _locationPermissionTitle = 'Location Permission Required';
  static const String _locationPermissionMessage = 'This app needs location access to show your position on the map and provide location-based services.';

  /// Check if location permissions are granted
  static Future<bool> hasLocationPermission() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }

  /// Request location permissions
  static Future<bool> requestLocationPermission(BuildContext context) async {
    // Check if location services are enabled
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      await _showLocationServiceDialog(context);
      return false;
    }

    // Check current permission status
    final status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      // Request permission
      final result = await Permission.location.request();
      if (result.isGranted) {
        return true;
      }
    }

    if (status.isPermanentlyDenied) {
      // Show dialog to open app settings
      await _showPermissionSettingsDialog(context);
      return false;
    }

    return false;
  }

  /// Show dialog when location services are disabled
  static Future<void> _showLocationServiceDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Location Services Disabled'),
          content: const Text(
            'Please enable location services in your device settings to use this app.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () async {
                Navigator.of(context).pop();
                await Geolocator.openLocationSettings();
              },
            ),
          ],
        );
      },
    );
  }

  /// Show dialog to open app settings when permissions are permanently denied
  static Future<void> _showPermissionSettingsDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(_locationPermissionTitle),
          content: const Text(
            'Location permissions have been permanently denied. Please enable them in app settings.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  /// Show permission explanation dialog
  static Future<bool> showPermissionExplanationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(_locationPermissionTitle),
              content: const Text(_locationPermissionMessage),
              actions: <Widget>[
                TextButton(
                  child: const Text('Deny'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Allow'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  /// Get current location with permission check
  static Future<Position?> getCurrentLocation(BuildContext context) async {
    try {
      // Check if we have permission
      if (!await hasLocationPermission()) {
        // Request permission
        final granted = await requestLocationPermission(context);
        if (!granted) {
          return null;
        }
      }

      // Get current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  /// Check if location services are enabled
  static Future<bool> isLocationServiceEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      debugPrint('Error checking location service status: $e');
      return false;
    }
  }

  /// Get detailed permission status
  static Future<Map<String, dynamic>> getPermissionStatus() async {
    try {
      final locationStatus = await Permission.location.status;
      final locationServiceEnabled = await Geolocator.isLocationServiceEnabled();

      return {
        'locationPermission': locationStatus.name,
        'locationServiceEnabled': locationServiceEnabled,
        'isGranted': locationStatus.isGranted,
        'isDenied': locationStatus.isDenied,
        'isPermanentlyDenied': locationStatus.isPermanentlyDenied,
        'isRestricted': locationStatus.isRestricted,
      };
    } catch (e) {
      debugPrint('Error getting permission status: $e');
      return {
        'error': e.toString(),
      };
    }
  }

  /// Check if location permission is permanently denied
  static Future<bool> isLocationPermissionPermanentlyDenied() async {
    final status = await Permission.location.status;
    return status.isPermanentlyDenied;
  }

  /// Request location permission without showing dialogs (for startup checks)
  static Future<bool> requestLocationPermissionSilently() async {
    try {
      // Check if location services are enabled
      final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        return false;
      }

      // Check current permission status
      final status = await Permission.location.status;

      if (status.isGranted) {
        return true;
      }

      if (status.isDenied) {
        // Request permission silently
        final result = await Permission.location.request();
        return result.isGranted;
      }

      // If permanently denied or restricted, return false
      return false;
    } catch (e) {
      debugPrint('Error requesting location permission silently: $e');
      return false;
    }
  }

  /// Show helpful information about why location is needed
  static Future<void> showLocationInfoDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Why Location Access?'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('This app uses location access to:'),
              SizedBox(height: 8),
              Text('• Show your current position on the map'),
              Text('• Center the map on your location'),
              Text('• Provide location-based services'),
              Text('• Improve navigation experience'),
              SizedBox(height: 8),
              Text('Your location data is not shared or stored.'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Enable Location'),
              onPressed: () async {
                Navigator.of(context).pop();
                await requestLocationPermission(context);
              },
            ),
          ],
        );
      },
    );
  }
}
