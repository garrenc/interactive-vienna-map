import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:interactive_map_vienna_flutter/models/pinpoint.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_data.g.dart';

@riverpod
class MapDataNotifier extends _$MapDataNotifier {
  static const String _baseUrl = 'https://15dadc14cd83.ngrok-free.app';

  // Distance threshold in meters - points closer than this will be filtered out
  static const double _distanceThreshold = 100.0;

  Future<List<Pinpoint>> _getToilets() async {
    var body = json.encode({"method": "getToilets"});
    var result = await http.post(Uri.parse('$_baseUrl/toilet'), body: body);
    var resultJson = json.decode(result.body);
    return (resultJson as List).map((e) => Pinpoint.fromJson(e, type: PinpointType.toilet)).toList();
  }

  Future<List<Pinpoint>> _getWaterStations() async {
    var body = json.encode({"method": "getWaterStations"});
    var result = await http.post(Uri.parse('$_baseUrl/waterStation'), body: body);
    var resultJson = json.decode(result.body);

    return (resultJson as List).map((e) => Pinpoint.fromJson(e, type: PinpointType.water)).toList();
  }

  Future<List<Pinpoint>> _getAudioGuides() async {
    var body = json.encode({"method": "getPOIs"});
    var result = await http.post(Uri.parse('$_baseUrl/pOI'), body: body);
    var resultJson = json.decode(result.body);
    return (resultJson as List).map((e) => Pinpoint.fromJson(e, type: PinpointType.audioGuide)).toList();
  }

  /// Filters out points that are very close to each other
  /// Groups close points together and keeps the best one from each group
  List<Pinpoint> _filterNearbyPoints(List<Pinpoint> points) {
    if (points.length <= 1) return points;

    final List<Pinpoint> filteredPoints = [];
    final List<bool> processed = List.filled(points.length, false);

    for (int i = 0; i < points.length; i++) {
      if (processed[i]) continue;

      // Start a new group with this point
      final List<Pinpoint> group = [points[i]];
      processed[i] = true;

      // Find all points that are close to this one
      for (int j = i + 1; j < points.length; j++) {
        if (!processed[j] && _calculateDistance(points[i], points[j]) < _distanceThreshold) {
          group.add(points[j]);
          processed[j] = true;
        }
      }

      filteredPoints.add(group.first);
    }

    return filteredPoints;
  }

  /// Calculates the distance between two points using the Haversine formula
  double _calculateDistance(Pinpoint point1, Pinpoint point2) {
    const double earthRadius = 6371000; // Earth's radius in meters

    final double lat1Rad = point1.latitude * pi / 180;
    final double lat2Rad = point2.latitude * pi / 180;
    final double deltaLatRad = (point2.latitude - point1.latitude) * pi / 180;
    final double deltaLonRad = (point2.longitude - point1.longitude) * pi / 180;

    final double a = sin(deltaLatRad / 2) * sin(deltaLatRad / 2) + cos(lat1Rad) * cos(lat2Rad) * sin(deltaLonRad / 2) * sin(deltaLonRad / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  @override
  Future<List<Pinpoint>> build() async {
// Calling generated client code.
    try {
      var toilets = await _getToilets();
      var waterStations = await _getWaterStations();

      var audioGuides = await _getAudioGuides();

      // Filter nearby points within each type separately
      var filteredToilets = _filterNearbyPoints(toilets);
      var filteredWaterStations = _filterNearbyPoints(waterStations);

      return [...filteredToilets, ...filteredWaterStations, ...audioGuides];
    } catch (e) {
      return [];
    }
  }
}
