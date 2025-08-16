/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Our AI generated Recipe
abstract class WaterStation implements _i1.SerializableModel {
  WaterStation._({
    this.id,
    required this.objectId,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  factory WaterStation({
    int? id,
    required String objectId,
    required String type,
    required double latitude,
    required double longitude,
  }) = _WaterStationImpl;

  factory WaterStation.fromJson(Map<String, dynamic> jsonSerialization) {
    return WaterStation(
      id: jsonSerialization['id'] as int?,
      objectId: jsonSerialization['objectId'] as String,
      type: jsonSerialization['type'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The object id of the water station
  String objectId;

  /// The name of the water station
  String type;

  /// The latitude of the water station
  double latitude;

  /// The longitude of the water station
  double longitude;

  /// Returns a shallow copy of this [WaterStation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WaterStation copyWith({
    int? id,
    String? objectId,
    String? type,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'objectId': objectId,
      'type': type,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WaterStationImpl extends WaterStation {
  _WaterStationImpl({
    int? id,
    required String objectId,
    required String type,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          objectId: objectId,
          type: type,
          latitude: latitude,
          longitude: longitude,
        );

  /// Returns a shallow copy of this [WaterStation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WaterStation copyWith({
    Object? id = _Undefined,
    String? objectId,
    String? type,
    double? latitude,
    double? longitude,
  }) {
    return WaterStation(
      id: id is int? ? id : this.id,
      objectId: objectId ?? this.objectId,
      type: type ?? this.type,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
