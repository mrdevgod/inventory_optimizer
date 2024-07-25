import 'package:drift/src/runtime/query_builder/query_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/db/database.dart';

class ClientsNotifier extends StateNotifier<AsyncValue<List<Client>>> {
  final AppDatabase db;

  ClientsNotifier(this.db) : super(const AsyncValue.loading()) {
    _fetchClients();
  }

  Future<void> _fetchClients() async {
    try {
      final clients = await db.getAllClients();
      state = AsyncValue.data(clients);
    } catch (e, stacktrace) {
      state = AsyncValue.error(e, stacktrace);
    }
  }

  Future<void> addClient(Client client) async {
    await db.insertClient(client);
    await _fetchClients();
  }

  Future<void> deleteClient(Client client) async {
    await db.deleteClient(client);
    await _fetchClients();
  }

  Future<Client> getItemById(int id) async {
    return await db.getClientById(id);
  }
}

class OrdersNotifier extends StateNotifier<AsyncValue<List<Order>>> {
  final AppDatabase db;

  OrdersNotifier(this.db) : super(const AsyncValue.loading()) {
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    try {
      final orders = await db.getAllOrders();
      state = AsyncValue.data(orders);
    } catch (e, stacktrace) {
      state = AsyncValue.error(e, stacktrace);
    }
  }

  Future<void> addOrder(Order order) async {
    await db.insertOrder(order);
    await _fetchOrders();
  }

  Future<void> deleteOrder(Order order) async {
    await db.deleteOrder(order);
    await _fetchOrders();
  }
}

class InventoryNotifier extends StateNotifier<AsyncValue<List<InventoryData>>> {
  final AppDatabase db;

  InventoryNotifier(this.db) : super(const AsyncValue.loading()) {
    _fetchInventory();
  }

  Future<void> _fetchInventory() async {
    try {
      final inventory = await db.getAllInventory();
      state = AsyncValue.data(inventory);
    } catch (e, stacktrace) {
      state = AsyncValue.error(e, stacktrace);
    }
  }

  Future<void> addInventoryItem(InventoryData inventoryItem) async {
    await db.insertInventoryItem(inventoryItem);
    await _fetchInventory();
  }

  Future<void> deleteInventoryItem(InventoryData inventoryItem) async {
    await db.deleteInventoryItem(inventoryItem);
    await _fetchInventory();
  }

  Future<InventoryData> getItemById(int id) async {
    return await db.getInventoryItemById(id);
  }
}

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final clientsNotifierProvider =
    StateNotifierProvider<ClientsNotifier, AsyncValue<List<Client>>>((ref) {
  final db = ref.watch(databaseProvider);
  return ClientsNotifier(db);
});

final ordersNotifierProvider =
    StateNotifierProvider<OrdersNotifier, AsyncValue<List<Order>>>((ref) {
  final db = ref.watch(databaseProvider);
  return OrdersNotifier(db);
});

final inventoryNotifierProvider =
    StateNotifierProvider<InventoryNotifier, AsyncValue<List<InventoryData>>>(
        (ref) {
  final db = ref.watch(databaseProvider);
  return InventoryNotifier(db);
});

final clientsMenuSelected = StateProvider((ref) {
  int? selected;
  return selected;
});

final categoryMenuSelected = StateProvider((ref) {
  int? selected;
  return selected;
});
