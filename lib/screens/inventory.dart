import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/providers/providers.dart';
import 'package:inventory_optimizer/screens/add_product.dart';
import 'package:inventory_optimizer/widgets/app_drawer.dart';
import 'package:inventory_optimizer/widgets/main_app_bar.dart';
import 'package:inventory_optimizer/widgets/product_card.dart';

class Inventory extends ConsumerWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventoryAsyncValue = ref.watch(inventoryNotifierProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppBar(
            appBarTitle: 'مستودع المنتجات',
          ),
        ),
        body: inventoryAsyncValue.when(
          data: (products) {
            if (products.isEmpty) {
              return const Center(
                child: Text(
                  'لا توجد منتجات',
                  style: TextStyle(fontSize: 25.0),
                ),
              );
            }

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
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
                builder: (context) => const AddProduct(),
              ),
            );
          },
          label: const Text('إضافة منتج'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        drawer: const AppDrawer(),
      ),
    );
  }
}
