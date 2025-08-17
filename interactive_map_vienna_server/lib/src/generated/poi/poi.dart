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

abstract class POI implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = POITable();

  static const db = POIRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static POIInclude include() {
    return POIInclude._();
  }

  static POIIncludeList includeList({
    _i1.WhereExpressionBuilder<POITable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<POITable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<POITable>? orderByList,
    POIInclude? include,
  }) {
    return POIIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(POI.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(POI.t),
      include: include,
    );
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

class POITable extends _i1.Table<int?> {
  POITable({super.tableRelation}) : super(tableName: 'pois') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    zip = _i1.ColumnString(
      'zip',
      this,
    );
    city = _i1.ColumnString(
      'city',
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
    tel1 = _i1.ColumnString(
      'tel1',
      this,
    );
    tel1Comment = _i1.ColumnString(
      'tel1Comment',
      this,
    );
    tel2 = _i1.ColumnString(
      'tel2',
      this,
    );
    tel2Comment = _i1.ColumnString(
      'tel2Comment',
      this,
    );
    tel3 = _i1.ColumnString(
      'tel3',
      this,
    );
    tel3Comment = _i1.ColumnString(
      'tel3Comment',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    webUrl = _i1.ColumnString(
      'webUrl',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString category;

  late final _i1.ColumnString description;

  late final _i1.ColumnString address;

  late final _i1.ColumnString zip;

  late final _i1.ColumnString city;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnString tel1;

  late final _i1.ColumnString tel1Comment;

  late final _i1.ColumnString tel2;

  late final _i1.ColumnString tel2Comment;

  late final _i1.ColumnString tel3;

  late final _i1.ColumnString tel3Comment;

  late final _i1.ColumnString email;

  late final _i1.ColumnString webUrl;

  late final _i1.ColumnString url;

  late final _i1.ColumnString imageUrl;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        category,
        description,
        address,
        zip,
        city,
        latitude,
        longitude,
        tel1,
        tel1Comment,
        tel2,
        tel2Comment,
        tel3,
        tel3Comment,
        email,
        webUrl,
        url,
        imageUrl,
      ];
}

class POIInclude extends _i1.IncludeObject {
  POIInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => POI.t;
}

class POIIncludeList extends _i1.IncludeList {
  POIIncludeList._({
    _i1.WhereExpressionBuilder<POITable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(POI.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => POI.t;
}

class POIRepository {
  const POIRepository._();

  /// Returns a list of [POI]s matching the given query parameters.
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
  Future<List<POI>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<POITable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<POITable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<POITable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<POI>(
      where: where?.call(POI.t),
      orderBy: orderBy?.call(POI.t),
      orderByList: orderByList?.call(POI.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [POI] matching the given query parameters.
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
  Future<POI?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<POITable>? where,
    int? offset,
    _i1.OrderByBuilder<POITable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<POITable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<POI>(
      where: where?.call(POI.t),
      orderBy: orderBy?.call(POI.t),
      orderByList: orderByList?.call(POI.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [POI] by its [id] or null if no such row exists.
  Future<POI?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<POI>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [POI]s in the list and returns the inserted rows.
  ///
  /// The returned [POI]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<POI>> insert(
    _i1.Session session,
    List<POI> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<POI>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [POI] and returns the inserted row.
  ///
  /// The returned [POI] will have its `id` field set.
  Future<POI> insertRow(
    _i1.Session session,
    POI row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<POI>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [POI]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<POI>> update(
    _i1.Session session,
    List<POI> rows, {
    _i1.ColumnSelections<POITable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<POI>(
      rows,
      columns: columns?.call(POI.t),
      transaction: transaction,
    );
  }

  /// Updates a single [POI]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<POI> updateRow(
    _i1.Session session,
    POI row, {
    _i1.ColumnSelections<POITable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<POI>(
      row,
      columns: columns?.call(POI.t),
      transaction: transaction,
    );
  }

  /// Deletes all [POI]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<POI>> delete(
    _i1.Session session,
    List<POI> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<POI>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [POI].
  Future<POI> deleteRow(
    _i1.Session session,
    POI row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<POI>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<POI>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<POITable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<POI>(
      where: where(POI.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<POITable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<POI>(
      where: where?.call(POI.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
