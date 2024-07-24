import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  IntColumn get to => integer().references(Clients, #id)();
  IntColumn get category => integer().references(Inventory, #id)();
  IntColumn get quantity => integer()();
  DateTimeColumn get createdAt => dateTime()();
}

class Inventory extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text()();
  IntColumn get unitPrice => integer()();
  IntColumn get quantity => integer()();
}

class Clients extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get address => text()();
  TextColumn get extraInfo => text().nullable()();
}

@DriftDatabase(tables: [Orders, Inventory, Clients])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static _openConnection() {
    return driftDatabase(name: 'db');
  }

  // Orders
  Future<List<Order>> getAllOrders() => select(orders).get();
  Future<int> insertOrder(Order order) => into(orders).insert(order);
  Future<bool> updateOrder(Order order) => update(orders).replace(order);
  Future<int> deleteOrder(Order order) => delete(orders).delete(order);

  // Clients
  Future<List<Client>> getAllClients() => select(clients).get();
  Future<int> insertClient(Client client) => into(clients).insert(client);
  Future<bool> updateClient(Client client) => update(clients).replace(client);
  Future<int> deleteClient(Client client) => delete(clients).delete(client);

  // Inventory
  Future<List<InventoryData>> getAllInventory() => select(inventory).get();
  Future<int> insertInventoryItem(InventoryData inventoryItem) =>
      into(inventory).insert(inventoryItem);
  Future<bool> updateInventoryItem(InventoryData inventoryItem) =>
      update(inventory).replace(inventoryItem);
  Future<int> deleteInventoryItem(InventoryData inventoryItem) =>
      delete(inventory).delete(inventoryItem);
}
