import 'package:flutter/material.dart';

enum PinpointType {
  toilet,
  water,
  charging,
  wifi,
  audioGuide;

  IconData get icon => switch (this) {
        toilet => Icons.wc,
        water => Icons.water_drop_outlined,
        audioGuide => Icons.headphones_outlined,
        charging => Icons.charging_station_outlined,
        wifi => Icons.wifi,
      };

  Color get color => switch (this) {
        toilet => Colors.grey,
        water => Colors.teal,
        audioGuide => Colors.orange,
        charging => Colors.green,
        wifi => Colors.deepPurpleAccent,
      };

  String get title => switch (this) {
        toilet => 'Toilet',
        water => 'Water Fountain',
        audioGuide => 'Audio Guide',
        charging => 'Charging',
        wifi => 'Wifi',
      };
}

class Pinpoint {
  final PinpointType type;
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Pinpoint({required this.type, required this.id, required this.title, required this.description, required this.imageUrl});
}
