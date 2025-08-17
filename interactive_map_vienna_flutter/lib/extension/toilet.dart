import 'package:interactive_map_vienna_client/interactive_map_vienna_client.dart';
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';

extension ToiletExtension on Toilet {
  Pinpoint toPinpoint() {
    return Pinpoint(
      type: PinpointType.toilet,
      id: id.toString(),
      title: 'Toilet - $street',
      description: 'Toilet',
      latitude: latitude,
      longitude: longitude,
      imageUrl: null,
    );
  }
}
