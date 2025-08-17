import 'package:interactive_map_vienna_client/interactive_map_vienna_client.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';

extension WaterStationExtension on WaterStation {
  Pinpoint toPinpoint() {
    return Pinpoint(
      type: PinpointType.water,
      id: id.toString(),
      title: 'Water Station',
      description: 'Water Station',
      imageUrl: null,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
