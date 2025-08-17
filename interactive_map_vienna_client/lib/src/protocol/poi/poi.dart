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

abstract class POI implements _i1.SerializableModel {
  POI._({
    this.id,
    required this.title,
    this.category,
    this.description,
    this.address,
    this.zip,
    this.city,
    this.latitude,
    this.longitude,
    this.tel1,
    this.tel1Comment,
    this.tel2,
    this.tel2Comment,
    this.tel3,
    this.tel3Comment,
    this.email,
    this.webUrl,
    this.url,
    this.imageUrl,
  });

  factory POI({
    int? id,
    required String title,
    String? category,
    String? description,
    String? address,
    String? zip,
    String? city,
    double? latitude,
    double? longitude,
    String? tel1,
    String? tel1Comment,
    String? tel2,
    String? tel2Comment,
    String? tel3,
    String? tel3Comment,
    String? email,
    String? webUrl,
    String? url,
    String? imageUrl,
  }) = _POIImpl;

  factory POI.fromJson(Map<String, dynamic> jsonSerialization) {
    return POI(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      category: jsonSerialization['category'] as String?,
      description: jsonSerialization['description'] as String?,
      address: jsonSerialization['address'] as String?,
      zip: jsonSerialization['zip'] as String?,
      city: jsonSerialization['city'] as String?,
      latitude: (jsonSerialization['latitude'] as num?)?.toDouble(),
      longitude: (jsonSerialization['longitude'] as num?)?.toDouble(),
      tel1: jsonSerialization['tel1'] as String?,
      tel1Comment: jsonSerialization['tel1Comment'] as String?,
      tel2: jsonSerialization['tel2'] as String?,
      tel2Comment: jsonSerialization['tel2Comment'] as String?,
      tel3: jsonSerialization['tel3'] as String?,
      tel3Comment: jsonSerialization['tel3Comment'] as String?,
      email: jsonSerialization['email'] as String?,
      webUrl: jsonSerialization['webUrl'] as String?,
      url: jsonSerialization['url'] as String?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? category;

  String? description;

  String? address;

  String? zip;

  String? city;

  double? latitude;

  double? longitude;

  String? tel1;

  String? tel1Comment;

  String? tel2;

  String? tel2Comment;

  String? tel3;

  String? tel3Comment;

  String? email;

  String? webUrl;

  String? url;

  String? imageUrl;

  /// Returns a shallow copy of this [POI]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  POI copyWith({
    int? id,
    String? title,
    String? category,
    String? description,
    String? address,
    String? zip,
    String? city,
    double? latitude,
    double? longitude,
    String? tel1,
    String? tel1Comment,
    String? tel2,
    String? tel2Comment,
    String? tel3,
    String? tel3Comment,
    String? email,
    String? webUrl,
    String? url,
    String? imageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (zip != null) 'zip': zip,
      if (city != null) 'city': city,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (tel1 != null) 'tel1': tel1,
      if (tel1Comment != null) 'tel1Comment': tel1Comment,
      if (tel2 != null) 'tel2': tel2,
      if (tel2Comment != null) 'tel2Comment': tel2Comment,
      if (tel3 != null) 'tel3': tel3,
      if (tel3Comment != null) 'tel3Comment': tel3Comment,
      if (email != null) 'email': email,
      if (webUrl != null) 'webUrl': webUrl,
      if (url != null) 'url': url,
      if (imageUrl != null) 'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _POIImpl extends POI {
  _POIImpl({
    int? id,
    required String title,
    String? category,
    String? description,
    String? address,
    String? zip,
    String? city,
    double? latitude,
    double? longitude,
    String? tel1,
    String? tel1Comment,
    String? tel2,
    String? tel2Comment,
    String? tel3,
    String? tel3Comment,
    String? email,
    String? webUrl,
    String? url,
    String? imageUrl,
  }) : super._(
          id: id,
          title: title,
          category: category,
          description: description,
          address: address,
          zip: zip,
          city: city,
          latitude: latitude,
          longitude: longitude,
          tel1: tel1,
          tel1Comment: tel1Comment,
          tel2: tel2,
          tel2Comment: tel2Comment,
          tel3: tel3,
          tel3Comment: tel3Comment,
          email: email,
          webUrl: webUrl,
          url: url,
          imageUrl: imageUrl,
        );

  /// Returns a shallow copy of this [POI]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  POI copyWith({
    Object? id = _Undefined,
    String? title,
    Object? category = _Undefined,
    Object? description = _Undefined,
    Object? address = _Undefined,
    Object? zip = _Undefined,
    Object? city = _Undefined,
    Object? latitude = _Undefined,
    Object? longitude = _Undefined,
    Object? tel1 = _Undefined,
    Object? tel1Comment = _Undefined,
    Object? tel2 = _Undefined,
    Object? tel2Comment = _Undefined,
    Object? tel3 = _Undefined,
    Object? tel3Comment = _Undefined,
    Object? email = _Undefined,
    Object? webUrl = _Undefined,
    Object? url = _Undefined,
    Object? imageUrl = _Undefined,
  }) {
    return POI(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      category: category is String? ? category : this.category,
      description: description is String? ? description : this.description,
      address: address is String? ? address : this.address,
      zip: zip is String? ? zip : this.zip,
      city: city is String? ? city : this.city,
      latitude: latitude is double? ? latitude : this.latitude,
      longitude: longitude is double? ? longitude : this.longitude,
      tel1: tel1 is String? ? tel1 : this.tel1,
      tel1Comment: tel1Comment is String? ? tel1Comment : this.tel1Comment,
      tel2: tel2 is String? ? tel2 : this.tel2,
      tel2Comment: tel2Comment is String? ? tel2Comment : this.tel2Comment,
      tel3: tel3 is String? ? tel3 : this.tel3,
      tel3Comment: tel3Comment is String? ? tel3Comment : this.tel3Comment,
      email: email is String? ? email : this.email,
      webUrl: webUrl is String? ? webUrl : this.webUrl,
      url: url is String? ? url : this.url,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
    );
  }
}
