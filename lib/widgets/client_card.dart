import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/db/database.dart';
import 'package:inventory_optimizer/providers/providers.dart';

class ClientCard extends ConsumerWidget {
  final Client client;

  const ClientCard({
    super.key,
    required this.client,
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
        title: Text(client.name),
        subtitle: Text(
            '${client.address} | ${client.phoneNumber} | ${client.extraInfo}'),
        trailing: TextButton(
          child: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
          onPressed: () async {
            await ref
                .read(clientsNotifierProvider.notifier)
                .deleteClient(client);

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حذف الزبون بنجاح.')),
              );
            }
          },
        ),
      ),
    );
  }
}
