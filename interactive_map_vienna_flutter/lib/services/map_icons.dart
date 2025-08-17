import 'package:flutter/services.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';

class MapIconsService {
  static Map<PinpointType, Uint8List> assets = {};

  static Future<Uint8List> loadMarkerImage({required String asset}) async {
    var byteData = await rootBundle.load("assets/images/$asset.png");
    return byteData.buffer.asUint8List();
  }

  static Future<void> preloadIcons() async {
    for (var type in PinpointType.values) {
      if (type.asset.isNotEmpty) {
        var markerImage = await loadMarkerImage(asset: type.asset);
        assets[type] = markerImage;
      }
    }
  }
}
