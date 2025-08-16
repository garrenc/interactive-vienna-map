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

/// Toilet schema based on WCANLAGE2OGD.csv
abstract class Toilet implements _i1.SerializableModel {
  Toilet._({
    this.id,
    required this.objectId,
    required this.wcId,
    required this.district,
    required this.street,
    this.locationDetails,
    required this.isActive,
    required this.openingHours,
    required this.restrictions,
    required this.staffSupervision,
    required this.category,
    required this.equipment,
    required this.icon,
    required this.iconText,
    required this.contact,
    required this.department,
    required this.information,
    required this.latitude,
    required this.longitude,
  });

  factory Toilet({
    int? id,
    required String objectId,
    required String wcId,
    required String district,
    required String street,
    String? locationDetails,
    required bool isActive,
    required String openingHours,
    required String restrictions,
    required String staffSupervision,
    required String category,
    required String equipment,
    required String icon,
    required String iconText,
    required String contact,
    required String department,
    required String information,
    required double latitude,
    required double longitude,
  }) = _ToiletImpl;

  factory Toilet.fromJson(Map<String, dynamic> jsonSerialization) {
    return Toilet(
      id: jsonSerialization['id'] as int?,
      objectId: jsonSerialization['objectId'] as String,
      wcId: jsonSerialization['wcId'] as String,
      district: jsonSerialization['district'] as String,
      street: jsonSerialization['street'] as String,
      locationDetails: jsonSerialization['locationDetails'] as String?,
      isActive: jsonSerialization['isActive'] as bool,
      openingHours: jsonSerialization['openingHours'] as String,
      restrictions: jsonSerialization['restrictions'] as String,
      staffSupervision: jsonSerialization['staffSupervision'] as String,
      category: jsonSerialization['category'] as String,
      equipment: jsonSerialization['equipment'] as String,
      icon: jsonSerialization['icon'] as String,
      iconText: jsonSerialization['iconText'] as String,
      contact: jsonSerialization['contact'] as String,
      department: jsonSerialization['department'] as String,
      information: jsonSerialization['information'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The object id of the toilet
  String objectId;

  /// The WC_ID from the dataset
  String wcId;

  /// The district number
  String district;

  /// The street address
  String street;

  /// Additional location information
  String? locationDetails;

  /// Whether the toilet is active
  bool isActive;

  /// Opening hours
  String openingHours;

  /// Restrictions information
  String restrictions;

  /// Staff supervision information
  String staffSupervision;

  /// Category information
  String category;

  /// Equipment/facilities information
  String equipment;

  /// Icon type
  String icon;

  /// Accessibility information
  String iconText;

  /// Contact information
  String contact;

  /// Department responsible
  String department;

  /// URL with more information
  String information;

  /// The latitude of the toilet
  double latitude;

  /// The longitude of the toilet
  double longitude;

  /// Returns a shallow copy of this [Toilet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Toilet copyWith({
    int? id,
    String? objectId,
    String? wcId,
    String? district,
    String? street,
    String? locationDetails,
    bool? isActive,
    String? openingHours,
    String? restrictions,
    String? staffSupervision,
    String? category,
    String? equipment,
    String? icon,
    String? iconText,
    String? contact,
    String? department,
    String? information,
    double? latitude,
    double? longitude,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'objectId': objectId,
      'wcId': wcId,
      'district': district,
      'street': street,
      if (locationDetails != null) 'locationDetails': locationDetails,
      'isActive': isActive,
      'openingHours': openingHours,
      'restrictions': restrictions,
      'staffSupervision': staffSupervision,
      'category': category,
      'equipment': equipment,
      'icon': icon,
      'iconText': iconText,
      'contact': contact,
      'department': department,
      'information': information,
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

class _ToiletImpl extends Toilet {
  _ToiletImpl({
    int? id,
    required String objectId,
    required String wcId,
    required String district,
    required String street,
    String? locationDetails,
    required bool isActive,
    required String openingHours,
    required String restrictions,
    required String staffSupervision,
    required String category,
    required String equipment,
    required String icon,
    required String iconText,
    required String contact,
    required String department,
    required String information,
    required double latitude,
    required double longitude,
  }) : super._(
          id: id,
          objectId: objectId,
          wcId: wcId,
          district: district,
          street: street,
          locationDetails: locationDetails,
          isActive: isActive,
          openingHours: openingHours,
          restrictions: restrictions,
          staffSupervision: staffSupervision,
          category: category,
          equipment: equipment,
          icon: icon,
          iconText: iconText,
          contact: contact,
          department: department,
          information: information,
          latitude: latitude,
          longitude: longitude,
        );

  /// Returns a shallow copy of this [Toilet]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Toilet copyWith({
    Object? id = _Undefined,
    String? objectId,
    String? wcId,
    String? district,
    String? street,
    Object? locationDetails = _Undefined,
    bool? isActive,
    String? openingHours,
    String? restrictions,
    String? staffSupervision,
    String? category,
    String? equipment,
    String? icon,
    String? iconText,
    String? contact,
    String? department,
    String? information,
    double? latitude,
    double? longitude,
  }) {
    return Toilet(
      id: id is int? ? id : this.id,
      objectId: objectId ?? this.objectId,
      wcId: wcId ?? this.wcId,
      district: district ?? this.district,
      street: street ?? this.street,
      locationDetails:
          locationDetails is String? ? locationDetails : this.locationDetails,
      isActive: isActive ?? this.isActive,
      openingHours: openingHours ?? this.openingHours,
      restrictions: restrictions ?? this.restrictions,
      staffSupervision: staffSupervision ?? this.staffSupervision,
      category: category ?? this.category,
      equipment: equipment ?? this.equipment,
      icon: icon ?? this.icon,
      iconText: iconText ?? this.iconText,
      contact: contact ?? this.contact,
      department: department ?? this.department,
      information: information ?? this.information,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
