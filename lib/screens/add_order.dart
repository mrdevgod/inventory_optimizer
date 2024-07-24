import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/db/database.dart';
import 'package:inventory_optimizer/providers/providers.dart';
import 'package:inventory_optimizer/widgets/app_drawer.dart';
import 'package:inventory_optimizer/widgets/category_dropdown.dart';
import 'package:inventory_optimizer/widgets/clients_dropdown.dart';
import 'package:inventory_optimizer/widgets/main_app_bar.dart';

class AddOrder extends ConsumerWidget {
  const AddOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController quantity = TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppBar(
            appBarTitle: 'إضافة طلبية',
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: title,
                        decoration: const InputDecoration(
                          labelText: 'عنوان الطلبية',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          floatingLabelStyle:
                              TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClientsDropdown(),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: description,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'شرح الطلبية',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      floatingLabelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CategoryDropdown(),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: quantity,
                        decoration: const InputDecoration(
                          labelText: 'العدد',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          floatingLabelStyle:
                              TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: FilledButton(
                  onPressed: () async {
                    final orderNotifier =
                        ref.read(ordersNotifierProvider.notifier);

                    final newOrder = Order(
                      id: null,
                      title: title.text,
                      description: description.text,
                      category: ref.watch(categoryMenuSelected) ?? 0,
                      to: ref.watch(clientsMenuSelected) ?? 0,
                      quantity: int.parse(quantity.text),
                      createdAt: DateTime.now(),
                    );

                    await orderNotifier.addOrder(newOrder);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('تمت إضافة الطلبية بنجاح')),
                      );

                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blueAccent),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('حفظ الطلبية'),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: const AppDrawer(),
      ),
    );
  }
}
