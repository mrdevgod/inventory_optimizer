import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/db/database.dart';
import 'package:inventory_optimizer/providers/providers.dart';

class Item extends StatelessWidget {
  final String name;
  final String value;

  const Item({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(name),
          ),
          Expanded(
            flex: 1,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends ConsumerWidget {
  final Order order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<InventoryData> getCategory(int id) async {
      return ref.watch(inventoryNotifierProvider.notifier).getItemById(id);
    }

    Future<Client> getClient(int id) async {
      return ref.watch(clientsNotifierProvider.notifier).getItemById(id);
    }

    return Expanded(
      child: Card(
        color: Colors.grey[100],
        child: ExpansionTile(
          trailing: TextButton(
            child: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () async {
              await ref
                  .read(ordersNotifierProvider.notifier)
                  .deleteOrder(order);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم حذف الطلبية بنجاح.')),
                );
              }
            },
          ),
          title: Text(order.title),
          children: [
            Item(
              name: 'رقم الطلبية:',
              value: order.id.toString(),
            ),
            Item(name: 'شرح الطلبية:', value: order.description!),
            FutureBuilder(
              future: getCategory(order.category),
              builder: (BuildContext context,
                  AsyncSnapshot<InventoryData> snapshot) {
                if (snapshot.hasData) {
                  return Item(name: 'التصنيف:', value: snapshot.data!.name);
                }
                return const Text('جاري التحميل ...');
              },
            ),
            Item(name: 'العدد:', value: order.quantity.toString()),
            FutureBuilder(
              future: getClient(order.to),
              builder: (BuildContext context, AsyncSnapshot<Client> snapshot) {
                if (snapshot.hasData) {
                  return Item(name: 'المستلم:', value: snapshot.data!.name);
                }
                return const Text('جاري التحميل ...');
              },
            ),
            Item(name: 'التاريخ:', value: order.createdAt.toString()),
          ],
        ),
      ),
    );
  }
}
