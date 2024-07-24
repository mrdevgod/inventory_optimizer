import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/providers/providers.dart';

class CategoryDropdown extends ConsumerWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsyncValue = ref.watch(inventoryNotifierProvider);

    return categoriesAsyncValue.when(
      data: (categories) {
        if (categories.isEmpty) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: const Text('لا يوجد أصناف'),
          );
        }

        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                focusColor: Colors.transparent,
                value: ref.watch(categoryMenuSelected),
                hint: const Text('الصنف'),
                items: categories.map((category) {
                  return DropdownMenuItem<int>(
                    value: category.id,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (int? value) {
                  ref.read(categoryMenuSelected.notifier).state = value;
                },
              ),
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
