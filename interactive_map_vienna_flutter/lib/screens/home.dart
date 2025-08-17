import 'package:flutter/material.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';
import 'package:interactive_map_vienna_flutter/providers/map_data.dart';
import 'package:interactive_map_vienna_flutter/services/botton_modal_sheet.dart';
import 'package:interactive_map_vienna_flutter/services/map_icons.dart';
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

  List<Pinpoint> _pinpoints = [];

  List<Symbol> _symbols = [];

  @override
  Widget build(BuildContext context) {
    final mapData = ref.watch(mapDataNotifierProvider);
    return Scaffold(
      extendBodyBehindAppBar: true, // let content go under the bar
      appBar: FrostedAppBar(
        onPinpointsSelected: (type, remove) async {
          if (remove) {
            var symbolsToRemove = _symbols.where((element) => element.options.iconImage == type.asset).toList();

            await _mapController!.removeSymbols(symbolsToRemove);
            _symbols.removeWhere((element) => symbolsToRemove.contains(element));
          } else {
            var symbols = _pinpoints.where((element) => element.type == type).map((element) => element.toSymbolOptions()).toList();

            var result = await _mapController!.addSymbols(symbols);

            _symbols.addAll(result);
          }
        },
      ),
      /* drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [],
        ),
      ),*/
      body: mapData.when(
          data: (data) {
            if (_pinpoints.isEmpty) {
              _pinpoints = data;
            }

            return Column(
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
                    tiltGesturesEnabled: false,
                    doubleClickZoomEnabled: true,
                    // Customize attribution button
                    attributionButtonPosition: AttributionButtonPosition.topRight,
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
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

  Future<void> _removeMarker(Pinpoint pinpoint) async {
    var symbol = _symbols.firstWhere((element) => element.data?['type'] == pinpoint.type.name);
    await _mapController!.removeSymbol(symbol);
    _symbols.remove(symbol);
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;

    MapIconsService.assets.forEach((key, value) {
      _mapController!.addImage(key.asset, value);
    });

    _mapController!.onSymbolTapped.add((symbol) {
      // we need to also sadjust it to map rotation :)
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(symbol.options.geometry!.latitude, symbol.options.geometry!.longitude), 16),
        duration: const Duration(milliseconds: 500),
      );
      BottomModalSheetService.showBottomModalSheet(context, pinpoint: _pinpoints.firstWhere((element) => element.id == symbol.data?['id']));
    });

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
