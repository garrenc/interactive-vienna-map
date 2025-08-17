import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

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
        audioGuide => Color(0xFFE4B07A),
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

  String get asset => switch (this) { toilet => 'toilet', water => 'water', audioGuide => 'audio', _ => '' };

  String? get imageModal => switch (this) {
        toilet => 'toilet_image',
        water => 'water_drinking',
        _ => null,
      };
}

class Pinpoint {
  final PinpointType type;
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final String description;
  final String? imageUrl;

  Pinpoint({required this.type, required this.id, required this.title, required this.description, required this.imageUrl, required this.latitude, required this.longitude});

  factory Pinpoint.fromJson(Map<String, dynamic> json, {required PinpointType type}) {
    return Pinpoint(
      type: type,
      id: json['id'].toString(),
      title: json['title'] ?? type.title,
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  SymbolOptions toSymbolOptions() {
    return SymbolOptions(
      geometry: LatLng(latitude, longitude),
      iconImage: type.asset,
      iconSize: 2.5,
    );
  }
}
