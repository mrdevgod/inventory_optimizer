import 'package:flutter/material.dart';
import 'package:inventory_optimizer/screens/clients.dart';
import 'package:inventory_optimizer/screens/orders.dart';
import 'package:inventory_optimizer/screens/inventory.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  // ignore: prefer_typing_uninitialized_variables
  final route;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      trailing: const Icon(Icons.keyboard_arrow_left),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerListTile(title: 'الطلبيات', route: Orders()),
          DrawerListTile(title: 'مستودع المنتجات', route: Inventory()),
          DrawerListTile(title: 'مستودع المواد الأولية', route: Inventory()),
          DrawerListTile(title: 'الزبائن', route: Clients()),
          DrawerListTile(title: 'الوصفات', route: Inventory()),
          DrawerListTile(title: 'الموظفين', route: Inventory()),
          DrawerListTile(title: 'السجل', route: Inventory()),
        ],
      ),
    );
  }
}
