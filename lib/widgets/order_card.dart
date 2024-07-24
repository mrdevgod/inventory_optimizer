import 'package:flutter/material.dart';
import 'package:inventory_optimizer/db/database.dart';

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
          Text(name),
          Text(value),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ExpansionTile(
          title: Text(order.title),
          children: [
            Item(name: 'رقم الطلبية:', value: order.id.toString()),
            Item(name: 'شرح الطلبية:', value: order.description!),
            Item(name: 'التصنيف:', value: order.category.toString()),
            Item(name: 'العدد:', value: order.quantity.toString()),
            Item(name: 'المستلم:', value: order.to.toString()),
            Item(name: 'التاريخ:', value: order.createdAt.toString()),
          ],
        ),
      ),
    );
  }
}
