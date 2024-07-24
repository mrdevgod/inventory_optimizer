import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/db/database.dart';
import 'package:inventory_optimizer/providers/providers.dart';

class ProductCard extends ConsumerWidget {
  final InventoryData product;

  const ProductCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(product.name),
        subtitle: Text(
            'العدد: ${product.quantity} | سعر القطعة: ${product.unitPrice}'),
        trailing: TextButton(
          child: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
          onPressed: () async {
            await ref
                .read(inventoryNotifierProvider.notifier)
                .deleteInventoryItem(product);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حذف المنتج بنجاح.')),
              );
            }
          },
        ),
      ),
    );
  }
}
