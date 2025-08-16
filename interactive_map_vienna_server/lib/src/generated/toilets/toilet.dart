/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

/// Toilet schema based on WCANLAGE2OGD.csv
abstract class Toilet implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ToiletTable();

  static const db = ToiletRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ToiletInclude include() {
    return ToiletInclude._();
  }

  static ToiletIncludeList includeList({
    _i1.WhereExpressionBuilder<ToiletTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToiletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToiletTable>? orderByList,
    ToiletInclude? include,
  }) {
    return ToiletIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Toilet.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Toilet.t),
      include: include,
    );
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

class ToiletTable extends _i1.Table<int?> {
  ToiletTable({super.tableRelation}) : super(tableName: 'toilets') {
    objectId = _i1.ColumnString(
      'objectId',
      this,
    );
    wcId = _i1.ColumnString(
      'wcId',
      this,
    );
    district = _i1.ColumnString(
      'district',
      this,
    );
    street = _i1.ColumnString(
      'street',
      this,
    );
    locationDetails = _i1.ColumnString(
      'locationDetails',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    openingHours = _i1.ColumnString(
      'openingHours',
      this,
    );
    restrictions = _i1.ColumnString(
      'restrictions',
      this,
    );
    staffSupervision = _i1.ColumnString(
      'staffSupervision',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    equipment = _i1.ColumnString(
      'equipment',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
    iconText = _i1.ColumnString(
      'iconText',
      this,
    );
    contact = _i1.ColumnString(
      'contact',
      this,
    );
    department = _i1.ColumnString(
      'department',
      this,
    );
    information = _i1.ColumnString(
      'information',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
  }

  /// The object id of the toilet
  late final _i1.ColumnString objectId;

  /// The WC_ID from the dataset
  late final _i1.ColumnString wcId;

  /// The district number
  late final _i1.ColumnString district;

  /// The street address
  late final _i1.ColumnString street;

  /// Additional location information
  late final _i1.ColumnString locationDetails;

  /// Whether the toilet is active
  late final _i1.ColumnBool isActive;

  /// Opening hours
  late final _i1.ColumnString openingHours;

  /// Restrictions information
  late final _i1.ColumnString restrictions;

  /// Staff supervision information
  late final _i1.ColumnString staffSupervision;

  /// Category information
  late final _i1.ColumnString category;

  /// Equipment/facilities information
  late final _i1.ColumnString equipment;

  /// Icon type
  late final _i1.ColumnString icon;

  /// Accessibility information
  late final _i1.ColumnString iconText;

  /// Contact information
  late final _i1.ColumnString contact;

  /// Department responsible
  late final _i1.ColumnString department;

  /// URL with more information
  late final _i1.ColumnString information;

  /// The latitude of the toilet
  late final _i1.ColumnDouble latitude;

  /// The longitude of the toilet
  late final _i1.ColumnDouble longitude;

  @override
  List<_i1.Column> get columns => [
        id,
        objectId,
        wcId,
        district,
        street,
        locationDetails,
        isActive,
        openingHours,
        restrictions,
        staffSupervision,
        category,
        equipment,
        icon,
        iconText,
        contact,
        department,
        information,
        latitude,
        longitude,
      ];
}

class ToiletInclude extends _i1.IncludeObject {
  ToiletInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Toilet.t;
}

class ToiletIncludeList extends _i1.IncludeList {
  ToiletIncludeList._({
    _i1.WhereExpressionBuilder<ToiletTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Toilet.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Toilet.t;
}

class ToiletRepository {
  const ToiletRepository._();

  /// Returns a list of [Toilet]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Toilet>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToiletTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToiletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToiletTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Toilet>(
      where: where?.call(Toilet.t),
      orderBy: orderBy?.call(Toilet.t),
      orderByList: orderByList?.call(Toilet.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Toilet] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Toilet?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToiletTable>? where,
    int? offset,
    _i1.OrderByBuilder<ToiletTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToiletTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Toilet>(
      where: where?.call(Toilet.t),
      orderBy: orderBy?.call(Toilet.t),
      orderByList: orderByList?.call(Toilet.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Toilet] by its [id] or null if no such row exists.
  Future<Toilet?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Toilet>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Toilet]s in the list and returns the inserted rows.
  ///
  /// The returned [Toilet]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Toilet>> insert(
    _i1.Session session,
    List<Toilet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Toilet>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Toilet] and returns the inserted row.
  ///
  /// The returned [Toilet] will have its `id` field set.
  Future<Toilet> insertRow(
    _i1.Session session,
    Toilet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Toilet>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Toilet]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Toilet>> update(
    _i1.Session session,
    List<Toilet> rows, {
    _i1.ColumnSelections<ToiletTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Toilet>(
      rows,
      columns: columns?.call(Toilet.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Toilet]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Toilet> updateRow(
    _i1.Session session,
    Toilet row, {
    _i1.ColumnSelections<ToiletTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Toilet>(
      row,
      columns: columns?.call(Toilet.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Toilet]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Toilet>> delete(
    _i1.Session session,
    List<Toilet> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Toilet>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Toilet].
  Future<Toilet> deleteRow(
    _i1.Session session,
    Toilet row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Toilet>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Toilet>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ToiletTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Toilet>(
      where: where(Toilet.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToiletTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Toilet>(
      where: where?.call(Toilet.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
