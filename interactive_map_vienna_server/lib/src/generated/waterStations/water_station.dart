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

/// Our AI generated Recipe
abstract class WaterStation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = WaterStationTable();

  static const db = WaterStationRepository._();

  @override
  int? id;

  /// The object id of the water station
  String objectId;

  /// The name of the water station
  String type;

  /// The latitude of the water station
  double latitude;

  /// The longitude of the water station
  double longitude;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'objectId': objectId,
      'type': type,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  static WaterStationInclude include() {
    return WaterStationInclude._();
  }

  static WaterStationIncludeList includeList({
    _i1.WhereExpressionBuilder<WaterStationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WaterStationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WaterStationTable>? orderByList,
    WaterStationInclude? include,
  }) {
    return WaterStationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(WaterStation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(WaterStation.t),
      include: include,
    );
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

class WaterStationTable extends _i1.Table<int?> {
  WaterStationTable({super.tableRelation})
      : super(tableName: 'water_stations') {
    objectId = _i1.ColumnString(
      'objectId',
      this,
    );
    type = _i1.ColumnString(
      'type',
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

  /// The object id of the water station
  late final _i1.ColumnString objectId;

  /// The name of the water station
  late final _i1.ColumnString type;

  /// The latitude of the water station
  late final _i1.ColumnDouble latitude;

  /// The longitude of the water station
  late final _i1.ColumnDouble longitude;

  @override
  List<_i1.Column> get columns => [
        id,
        objectId,
        type,
        latitude,
        longitude,
      ];
}

class WaterStationInclude extends _i1.IncludeObject {
  WaterStationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => WaterStation.t;
}

class WaterStationIncludeList extends _i1.IncludeList {
  WaterStationIncludeList._({
    _i1.WhereExpressionBuilder<WaterStationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(WaterStation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => WaterStation.t;
}

class WaterStationRepository {
  const WaterStationRepository._();

  /// Returns a list of [WaterStation]s matching the given query parameters.
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
  Future<List<WaterStation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WaterStationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<WaterStationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WaterStationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<WaterStation>(
      where: where?.call(WaterStation.t),
      orderBy: orderBy?.call(WaterStation.t),
      orderByList: orderByList?.call(WaterStation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [WaterStation] matching the given query parameters.
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
  Future<WaterStation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WaterStationTable>? where,
    int? offset,
    _i1.OrderByBuilder<WaterStationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<WaterStationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<WaterStation>(
      where: where?.call(WaterStation.t),
      orderBy: orderBy?.call(WaterStation.t),
      orderByList: orderByList?.call(WaterStation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [WaterStation] by its [id] or null if no such row exists.
  Future<WaterStation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<WaterStation>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [WaterStation]s in the list and returns the inserted rows.
  ///
  /// The returned [WaterStation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<WaterStation>> insert(
    _i1.Session session,
    List<WaterStation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<WaterStation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [WaterStation] and returns the inserted row.
  ///
  /// The returned [WaterStation] will have its `id` field set.
  Future<WaterStation> insertRow(
    _i1.Session session,
    WaterStation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<WaterStation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [WaterStation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<WaterStation>> update(
    _i1.Session session,
    List<WaterStation> rows, {
    _i1.ColumnSelections<WaterStationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<WaterStation>(
      rows,
      columns: columns?.call(WaterStation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [WaterStation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<WaterStation> updateRow(
    _i1.Session session,
    WaterStation row, {
    _i1.ColumnSelections<WaterStationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<WaterStation>(
      row,
      columns: columns?.call(WaterStation.t),
      transaction: transaction,
    );
  }

  /// Deletes all [WaterStation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<WaterStation>> delete(
    _i1.Session session,
    List<WaterStation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<WaterStation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [WaterStation].
  Future<WaterStation> deleteRow(
    _i1.Session session,
    WaterStation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<WaterStation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<WaterStation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<WaterStationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<WaterStation>(
      where: where(WaterStation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<WaterStationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<WaterStation>(
      where: where?.call(WaterStation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
