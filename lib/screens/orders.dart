import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/providers/providers.dart';
import 'package:inventory_optimizer/screens/add_order.dart';
import 'package:inventory_optimizer/widgets/app_drawer.dart';
import 'package:inventory_optimizer/widgets/main_app_bar.dart';
import 'package:inventory_optimizer/widgets/order_card.dart';

class Orders extends ConsumerWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsyncValue = ref.watch(ordersNotifierProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppBar(
            appBarTitle: 'الطلبيات',
          ),
        ),
        body: ordersAsyncValue.when(
          data: (orders) {
            if (orders.isEmpty) {
              return const Center(
                child: Text(
                  'لا توجد طلبيات',
                  style: TextStyle(fontSize: 25.0),
                ),
              );
            }

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Row(
                  children: [
                    OrderCard(order: order),
                  ],
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, stack) => Text('Error: $e'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddOrder(),
              ),
            );
          },
          label: const Text('إضافة طلبية'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        drawer: const AppDrawer(),
      ),
    );
  }
}
