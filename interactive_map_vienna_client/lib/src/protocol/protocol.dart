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
import 'greeting.dart' as _i2;
import 'poi/poi.dart' as _i3;
import 'recipes/recipe.dart' as _i4;
import 'toilets/toilet.dart' as _i5;
import 'waterStations/water_station.dart' as _i6;
import 'package:interactive_map_vienna_client/src/protocol/poi/poi.dart' as _i7;
import 'package:interactive_map_vienna_client/src/protocol/recipes/recipe.dart'
    as _i8;
import 'package:interactive_map_vienna_client/src/protocol/toilets/toilet.dart'
    as _i9;
import 'package:interactive_map_vienna_client/src/protocol/waterStations/water_station.dart'
    as _i10;
export 'greeting.dart';
export 'poi/poi.dart';
export 'recipes/recipe.dart';
export 'toilets/toilet.dart';
export 'waterStations/water_station.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.POI) {
      return _i3.POI.fromJson(data) as T;
    }
    if (t == _i4.Recipe) {
      return _i4.Recipe.fromJson(data) as T;
    }
    if (t == _i5.Toilet) {
      return _i5.Toilet.fromJson(data) as T;
    }
    if (t == _i6.WaterStation) {
      return _i6.WaterStation.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.POI?>()) {
      return (data != null ? _i3.POI.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Recipe?>()) {
      return (data != null ? _i4.Recipe.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Toilet?>()) {
      return (data != null ? _i5.Toilet.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.WaterStation?>()) {
      return (data != null ? _i6.WaterStation.fromJson(data) : null) as T;
    }
    if (t == List<_i7.POI>) {
      return (data as List).map((e) => deserialize<_i7.POI>(e)).toList() as T;
    }
    if (t == List<_i8.Recipe>) {
      return (data as List).map((e) => deserialize<_i8.Recipe>(e)).toList()
          as T;
    }
    if (t == List<_i9.Toilet>) {
      return (data as List).map((e) => deserialize<_i9.Toilet>(e)).toList()
          as T;
    }
    if (t == List<_i10.WaterStation>) {
      return (data as List)
          .map((e) => deserialize<_i10.WaterStation>(e))
          .toList() as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.POI) {
      return 'POI';
    }
    if (data is _i4.Recipe) {
      return 'Recipe';
    }
    if (data is _i5.Toilet) {
      return 'Toilet';
    }
    if (data is _i6.WaterStation) {
      return 'WaterStation';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'POI') {
      return deserialize<_i3.POI>(data['data']);
    }
    if (dataClassName == 'Recipe') {
      return deserialize<_i4.Recipe>(data['data']);
    }
    if (dataClassName == 'Toilet') {
      return deserialize<_i5.Toilet>(data['data']);
    }
    if (dataClassName == 'WaterStation') {
      return deserialize<_i6.WaterStation>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
