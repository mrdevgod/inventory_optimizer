import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/providers/providers.dart';

class ClientsDropdown extends ConsumerWidget {
  const ClientsDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientsAsyncValue = ref.watch(clientsNotifierProvider);

    return clientsAsyncValue.when(
      data: (clients) {
        if (clients.isEmpty) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: const Text('لا يوجد زبائن'),
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
                value: ref.watch(clientsMenuSelected),
                hint: const Text('المستلم'),
                items: clients.map((client) {
                  return DropdownMenuItem<int>(
                    value: client.id,
                    child: Text(client.name),
                  );
                }).toList(),
                onChanged: (int? value) {
                  ref.read(clientsMenuSelected.notifier).state = value;
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
