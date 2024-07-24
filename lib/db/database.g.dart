// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _extraInfoMeta =
      const VerificationMeta('extraInfo');
  @override
  late final GeneratedColumn<String> extraInfo = GeneratedColumn<String>(
      'extra_info', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phoneNumber, address, extraInfo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('extra_info')) {
      context.handle(_extraInfoMeta,
          extraInfo.isAcceptableOrUnknown(data['extra_info']!, _extraInfoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      extraInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extra_info']),
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int? id;
  final String name;
  final String phoneNumber;
  final String address;
  final String? extraInfo;
  const Client(
      {this.id,
      required this.name,
      required this.phoneNumber,
      required this.address,
      this.extraInfo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || extraInfo != null) {
      map['extra_info'] = Variable<String>(extraInfo);
    }
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      phoneNumber: Value(phoneNumber),
      address: Value(address),
      extraInfo: extraInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(extraInfo),
    );
  }

  factory Client.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      address: serializer.fromJson<String>(json['address']),
      extraInfo: serializer.fromJson<String?>(json['extraInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'address': serializer.toJson<String>(address),
      'extraInfo': serializer.toJson<String?>(extraInfo),
    };
  }

  Client copyWith(
          {Value<int?> id = const Value.absent(),
          String? name,
          String? phoneNumber,
          String? address,
          Value<String?> extraInfo = const Value.absent()}) =>
      Client(
        id: id.present ? id.value : this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        extraInfo: extraInfo.present ? extraInfo.value : this.extraInfo,
      );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      address: data.address.present ? data.address.value : this.address,
      extraInfo: data.extraInfo.present ? data.extraInfo.value : this.extraInfo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('extraInfo: $extraInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phoneNumber, address, extraInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.address == this.address &&
          other.extraInfo == this.extraInfo);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int?> id;
  final Value<String> name;
  final Value<String> phoneNumber;
  final Value<String> address;
  final Value<String?> extraInfo;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.address = const Value.absent(),
    this.extraInfo = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phoneNumber,
    required String address,
    this.extraInfo = const Value.absent(),
  })  : name = Value(name),
        phoneNumber = Value(phoneNumber),
        address = Value(address);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? address,
    Expression<String>? extraInfo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (address != null) 'address': address,
      if (extraInfo != null) 'extra_info': extraInfo,
    });
  }

  ClientsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<String>? phoneNumber,
      Value<String>? address,
      Value<String?>? extraInfo}) {
    return ClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      extraInfo: extraInfo ?? this.extraInfo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (extraInfo.present) {
      map['extra_info'] = Variable<String>(extraInfo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('address: $address, ')
          ..write('extraInfo: $extraInfo')
          ..write(')'))
        .toString();
  }
}

class $InventoryTable extends Inventory
    with TableInfo<$InventoryTable, InventoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, unitPrice, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $InventoryTable createAlias(String alias) {
    return $InventoryTable(attachedDatabase, alias);
  }
}

class InventoryData extends DataClass implements Insertable<InventoryData> {
  final int? id;
  final String name;
  final int unitPrice;
  final int quantity;
  const InventoryData(
      {this.id,
      required this.name,
      required this.unitPrice,
      required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['name'] = Variable<String>(name);
    map['unit_price'] = Variable<int>(unitPrice);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  InventoryCompanion toCompanion(bool nullToAbsent) {
    return InventoryCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      unitPrice: Value(unitPrice),
      quantity: Value(quantity),
    );
  }

  factory InventoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  InventoryData copyWith(
          {Value<int?> id = const Value.absent(),
          String? name,
          int? unitPrice,
          int? quantity}) =>
      InventoryData(
        id: id.present ? id.value : this.id,
        name: name ?? this.name,
        unitPrice: unitPrice ?? this.unitPrice,
        quantity: quantity ?? this.quantity,
      );
  InventoryData copyWithCompanion(InventoryCompanion data) {
    return InventoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, unitPrice, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.unitPrice == this.unitPrice &&
          other.quantity == this.quantity);
}

class InventoryCompanion extends UpdateCompanion<InventoryData> {
  final Value<int?> id;
  final Value<String> name;
  final Value<int> unitPrice;
  final Value<int> quantity;
  const InventoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.quantity = const Value.absent(),
  });
  InventoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int unitPrice,
    required int quantity,
  })  : name = Value(name),
        unitPrice = Value(unitPrice),
        quantity = Value(quantity);
  static Insertable<InventoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? unitPrice,
    Expression<int>? quantity,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (quantity != null) 'quantity': quantity,
    });
  }

  InventoryCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<int>? unitPrice,
      Value<int>? quantity}) {
    return InventoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<int> to = GeneratedColumn<int>(
      'to', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES inventory (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, to, category, quantity, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      to: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int? id;
  final String title;
  final String? description;
  final int to;
  final int category;
  final int quantity;
  final DateTime createdAt;
  const Order(
      {this.id,
      required this.title,
      this.description,
      required this.to,
      required this.category,
      required this.quantity,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['to'] = Variable<int>(to);
    map['category'] = Variable<int>(category);
    map['quantity'] = Variable<int>(quantity);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      to: Value(to),
      category: Value(category),
      quantity: Value(quantity),
      createdAt: Value(createdAt),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      to: serializer.fromJson<int>(json['to']),
      category: serializer.fromJson<int>(json['category']),
      quantity: serializer.fromJson<int>(json['quantity']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'to': serializer.toJson<int>(to),
      'category': serializer.toJson<int>(category),
      'quantity': serializer.toJson<int>(quantity),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Order copyWith(
          {Value<int?> id = const Value.absent(),
          String? title,
          Value<String?> description = const Value.absent(),
          int? to,
          int? category,
          int? quantity,
          DateTime? createdAt}) =>
      Order(
        id: id.present ? id.value : this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        to: to ?? this.to,
        category: category ?? this.category,
        quantity: quantity ?? this.quantity,
        createdAt: createdAt ?? this.createdAt,
      );
  Order copyWithCompanion(OrdersCompanion data) {
    return Order(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      to: data.to.present ? data.to.value : this.to,
      category: data.category.present ? data.category.value : this.category,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('to: $to, ')
          ..write('category: $category, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, to, category, quantity, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.to == this.to &&
          other.category == this.category &&
          other.quantity == this.quantity &&
          other.createdAt == this.createdAt);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int?> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> to;
  final Value<int> category;
  final Value<int> quantity;
  final Value<DateTime> createdAt;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.to = const Value.absent(),
    this.category = const Value.absent(),
    this.quantity = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required int to,
    required int category,
    required int quantity,
    required DateTime createdAt,
  })  : title = Value(title),
        to = Value(to),
        category = Value(category),
        quantity = Value(quantity),
        createdAt = Value(createdAt);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? to,
    Expression<int>? category,
    Expression<int>? quantity,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (to != null) 'to': to,
      if (category != null) 'category': category,
      if (quantity != null) 'quantity': quantity,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrdersCompanion copyWith(
      {Value<int?>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? to,
      Value<int>? category,
      Value<int>? quantity,
      Value<DateTime>? createdAt}) {
    return OrdersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      to: to ?? this.to,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (to.present) {
      map['to'] = Variable<int>(to.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('to: $to, ')
          ..write('category: $category, ')
          ..write('quantity: $quantity, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $InventoryTable inventory = $InventoryTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [clients, inventory, orders];
}

typedef $$ClientsTableCreateCompanionBuilder = ClientsCompanion Function({
  Value<int?> id,
  required String name,
  required String phoneNumber,
  required String address,
  Value<String?> extraInfo,
});
typedef $$ClientsTableUpdateCompanionBuilder = ClientsCompanion Function({
  Value<int?> id,
  Value<String> name,
  Value<String> phoneNumber,
  Value<String> address,
  Value<String?> extraInfo,
});

class $$ClientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClientsTable,
    Client,
    $$ClientsTableFilterComposer,
    $$ClientsTableOrderingComposer,
    $$ClientsTableCreateCompanionBuilder,
    $$ClientsTableUpdateCompanionBuilder> {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ClientsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ClientsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String?> extraInfo = const Value.absent(),
          }) =>
              ClientsCompanion(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            address: address,
            extraInfo: extraInfo,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String name,
            required String phoneNumber,
            required String address,
            Value<String?> extraInfo = const Value.absent(),
          }) =>
              ClientsCompanion.insert(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            address: address,
            extraInfo: extraInfo,
          ),
        ));
}

class $$ClientsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get extraInfo => $state.composableBuilder(
      column: $state.table.extraInfo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter ordersRefs(
      ComposableFilter Function($$OrdersTableFilterComposer f) f) {
    final $$OrdersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.orders,
        getReferencedColumn: (t) => t.to,
        builder: (joinBuilder, parentComposers) => $$OrdersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.orders, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get phoneNumber => $state.composableBuilder(
      column: $state.table.phoneNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get address => $state.composableBuilder(
      column: $state.table.address,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get extraInfo => $state.composableBuilder(
      column: $state.table.extraInfo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$InventoryTableCreateCompanionBuilder = InventoryCompanion Function({
  Value<int?> id,
  required String name,
  required int unitPrice,
  required int quantity,
});
typedef $$InventoryTableUpdateCompanionBuilder = InventoryCompanion Function({
  Value<int?> id,
  Value<String> name,
  Value<int> unitPrice,
  Value<int> quantity,
});

class $$InventoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryTable,
    InventoryData,
    $$InventoryTableFilterComposer,
    $$InventoryTableOrderingComposer,
    $$InventoryTableCreateCompanionBuilder,
    $$InventoryTableUpdateCompanionBuilder> {
  $$InventoryTableTableManager(_$AppDatabase db, $InventoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$InventoryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$InventoryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> unitPrice = const Value.absent(),
            Value<int> quantity = const Value.absent(),
          }) =>
              InventoryCompanion(
            id: id,
            name: name,
            unitPrice: unitPrice,
            quantity: quantity,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String name,
            required int unitPrice,
            required int quantity,
          }) =>
              InventoryCompanion.insert(
            id: id,
            name: name,
            unitPrice: unitPrice,
            quantity: quantity,
          ),
        ));
}

class $$InventoryTableFilterComposer
    extends FilterComposer<_$AppDatabase, $InventoryTable> {
  $$InventoryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get unitPrice => $state.composableBuilder(
      column: $state.table.unitPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter ordersRefs(
      ComposableFilter Function($$OrdersTableFilterComposer f) f) {
    final $$OrdersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.orders,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder, parentComposers) => $$OrdersTableFilterComposer(
            ComposerState(
                $state.db, $state.db.orders, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$InventoryTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $InventoryTable> {
  $$InventoryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get unitPrice => $state.composableBuilder(
      column: $state.table.unitPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$OrdersTableCreateCompanionBuilder = OrdersCompanion Function({
  Value<int?> id,
  required String title,
  Value<String?> description,
  required int to,
  required int category,
  required int quantity,
  required DateTime createdAt,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int?> id,
  Value<String> title,
  Value<String?> description,
  Value<int> to,
  Value<int> category,
  Value<int> quantity,
  Value<DateTime> createdAt,
});

class $$OrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder> {
  $$OrdersTableTableManager(_$AppDatabase db, $OrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrdersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OrdersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> to = const Value.absent(),
            Value<int> category = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            title: title,
            description: description,
            to: to,
            category: category,
            quantity: quantity,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required int to,
            required int category,
            required int quantity,
            required DateTime createdAt,
          }) =>
              OrdersCompanion.insert(
            id: id,
            title: title,
            description: description,
            to: to,
            category: category,
            quantity: quantity,
            createdAt: createdAt,
          ),
        ));
}

class $$OrdersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ClientsTableFilterComposer get to {
    final $$ClientsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.to,
        referencedTable: $state.db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ClientsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.clients, joinBuilder, parentComposers)));
    return composer;
  }

  $$InventoryTableFilterComposer get category {
    final $$InventoryTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $state.db.inventory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$InventoryTableFilterComposer(ComposerState(
                $state.db, $state.db.inventory, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$OrdersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get quantity => $state.composableBuilder(
      column: $state.table.quantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ClientsTableOrderingComposer get to {
    final $$ClientsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.to,
        referencedTable: $state.db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ClientsTableOrderingComposer(ComposerState(
                $state.db, $state.db.clients, joinBuilder, parentComposers)));
    return composer;
  }

  $$InventoryTableOrderingComposer get category {
    final $$InventoryTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $state.db.inventory,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$InventoryTableOrderingComposer(ComposerState(
                $state.db, $state.db.inventory, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$InventoryTableTableManager get inventory =>
      $$InventoryTableTableManager(_db, _db.inventory);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
}
