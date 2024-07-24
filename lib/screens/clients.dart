import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/providers/providers.dart';
import 'package:inventory_optimizer/screens/add_client.dart';
import 'package:inventory_optimizer/widgets/app_drawer.dart';
import 'package:inventory_optimizer/widgets/client_card.dart';
import 'package:inventory_optimizer/widgets/main_app_bar.dart';

class Clients extends ConsumerWidget {
  const Clients({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientsAsyncValue = ref.watch(clientsNotifierProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppBar(
            appBarTitle: 'الزبائن',
          ),
        ),
        body: clientsAsyncValue.when(
          data: (clients) {
            if (clients.isEmpty) {
              return const Center(
                child: Text(
                  'لا يوجد زبائن',
                  style: TextStyle(fontSize: 25.0),
                ),
              );
            }

            return ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                return ClientCard(client: client);
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
                builder: (context) => const AddClient(),
              ),
            );
          },
          label: const Text('إضافة زبون'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        drawer: const AppDrawer(),
      ),
    );
  }
}
