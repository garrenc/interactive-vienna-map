import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:interactive_map_vienna_flutter/providers/location_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _mapController = MapController();
  bool _isMapReady = false;

  @override
  Widget build(BuildContext context) {
    final locationState = ref.watch(locationNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Map Vienna'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (locationState.hasValue && locationState.value!.hasLocation)
            IconButton(
              onPressed: () => ref.read(locationNotifierProvider.notifier).refreshLocation(),
              icon: const Icon(Icons.refresh),
            ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: locationState.hasValue && locationState.value!.hasLocation ? locationState.value!.location! : const LatLng(48.2082, 16.3738), // Vienna as fallback
              initialZoom: 16.0,
              onMapEvent: (MapEvent mapEvent) {
                if (!_isMapReady) {
                  setState(() {
                    _isMapReady = true;
                  });
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.interactive_map_vienna',
              ),
              MarkerLayer(
                markers: locationState.hasValue && locationState.value!.hasLocation
                    ? [
                        Marker(
                          point: locationState.value!.location!,
                          width: 80,
                          height: 80,
                          child: _buildLocationMarker(locationState.value!.heading ?? 0.0),
                        ),
                      ]
                    : [],
              ),
            ],
          ),

          // Map controls
          Positioned(
            right: 16,
            top: 100,
            child: Column(
              children: [
                FloatingActionButton.small(
                  onPressed: _isMapReady
                      ? () {
                          _mapController.move(
                            _mapController.camera.center,
                            _mapController.camera.zoom + 1,
                          );
                        }
                      : null,
                  heroTag: 'zoomIn',
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  onPressed: _isMapReady
                      ? () {
                          _mapController.move(
                            _mapController.camera.center,
                            _mapController.camera.zoom - 1,
                          );
                        }
                      : null,
                  heroTag: 'zoomOut',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: locationState.hasValue && locationState.value!.hasLocation
          ? FloatingActionButton(
              onPressed: _centerOnLocation,
              child: const Icon(Icons.my_location),
            )
          : null,
    );
  }

  void _centerOnLocation() {
    final locationState = ref.read(locationNotifierProvider);
    if (locationState.hasValue && locationState.value!.hasLocation) {
      _mapController.move(locationState.value!.location!, 16.0);
    }
  }

  Widget _buildLocationMarker(double heading) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer circle
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
          ),
          // Inner circle with direction indicator
          Transform.rotate(
            angle: -heading * (math.pi / 180) * -1,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.navigation,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
