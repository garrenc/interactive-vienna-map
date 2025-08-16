import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_compass/flutter_compass.dart';

part 'location_provider.g.dart';

/// Location state that holds the current location information
class LocationState {
  final LocationStatus status;
  final LatLng? location;
  final double? heading;
  final String message;

  const LocationState({
    required this.status,
    this.location,
    this.heading,
    required this.message,
  });

  LocationState copyWith({
    LocationStatus? status,
    LatLng? location,
    double? heading,
    String? message,
  }) {
    return LocationState(
      status: status ?? this.status,
      location: location ?? this.location,
      heading: heading ?? this.heading,
      message: message ?? this.message,
    );
  }

  bool get isActive => status == LocationStatus.active;
  bool get hasLocation => location != null;
  bool get hasError => status == LocationStatus.error;
  bool get needsPermission => status == LocationStatus.permissionDenied || status == LocationStatus.permissionDeniedForever;
}

/// Enum for different location states
enum LocationStatus {
  initial,
  serviceDisabled,
  permissionDenied,
  permissionDeniedForever,
  active,
  error,
}

/// Main location provider using the latest Riverpod code generation
@riverpod
class LocationNotifier extends _$LocationNotifier {
  StreamSubscription<Position>? _positionStream;
  StreamSubscription<CompassEvent>? _compassStream;

  // For compass heading
  double _currentHeading = 0.0;
  bool _isCompassActive = false;

  @override
  Future<LocationState> build() async {
    ref.onDispose(() {
      _positionStream?.cancel();
      _compassStream?.cancel();
    });

    // Initialize with checking permissions
    return await _checkLocationPermission();
  }

  /// Check and request location permissions
  Future<LocationState> _checkLocationPermission() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return const LocationState(
          status: LocationStatus.serviceDisabled,
          message: 'Location services are disabled. Please enable them.',
        );
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const LocationState(
            status: LocationStatus.permissionDenied,
            message: 'Location permission denied.',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const LocationState(
          status: LocationStatus.permissionDeniedForever,
          message: 'Location permissions are permanently denied. Please enable them in settings.',
        );
      }

      // Permission granted, get current location
      return await _getCurrentLocation();
    } catch (e) {
      return LocationState(
        status: LocationStatus.error,
        message: 'Error checking location permission: $e',
      );
    }
  }

  /// Get current location
  Future<LocationState> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      final location = LatLng(position.latitude, position.longitude);

      // Start location updates
      _startLocationUpdates();

      return LocationState(
        status: LocationStatus.active,
        location: location,
        heading: _currentHeading, // Use our compass heading
        message: 'Location obtained successfully!',
      );
    } catch (e) {
      return LocationState(
        status: LocationStatus.error,
        message: 'Error getting current location: $e',
      );
    }
  }

  /// Start continuous location updates
  void _startLocationUpdates() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // Update every 10 meters
    );

    _positionStream?.cancel();
    _positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) {
      // Update state with new location
      state = AsyncValue.data(LocationState(
        status: LocationStatus.active,
        location: LatLng(position.latitude, position.longitude),
        heading: _currentHeading, // Use our compass heading
        message: 'Location updated',
      ));
    }, onError: (error) {
      state = AsyncValue.error(error, StackTrace.current);
    });

    _startCompassUpdates();
  }

  /// Start compass updates
  void _startCompassUpdates() {
    _compassStream?.cancel();
    _compassStream = FlutterCompass.events?.listen(
      (CompassEvent event) {
        if (event.heading != null) {
          _currentHeading = event.heading!;
          _isCompassActive = true;

          // Update state with new heading
          if (state.hasValue) {
            state = AsyncValue.data(state.value!.copyWith(
              heading: _currentHeading,
            ));
          }
        }
      },
      onError: (error) {
        print('Compass error: $error');
        _isCompassActive = false;
      },
    );
  }

  /// Refresh location
  Future<void> refreshLocation() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _getCurrentLocation());
  }

  /// Reset compass heading (useful for calibration)
  void resetCompassHeading() {
    _currentHeading = 0.0;
  }

  /// Get current compass status
  bool get isCompassActive => _isCompassActive;
}
