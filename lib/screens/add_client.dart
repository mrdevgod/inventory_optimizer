import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory_optimizer/db/database.dart';
import 'package:inventory_optimizer/providers/providers.dart';
import 'package:inventory_optimizer/widgets/app_drawer.dart';
import 'package:inventory_optimizer/widgets/main_app_bar.dart';

class AddClient extends ConsumerWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextEditingController name = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController extraInfo = TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppBar(
            appBarTitle: 'إضافة زبون',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1, vertical: 20.0),
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: 'اسم الزبون',
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      labelText: 'عنوان الزبون',
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    decoration: const InputDecoration(
                      labelText: 'رقم الزبون',
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: extraInfo,
                    decoration: const InputDecoration(
                      labelText: 'معلومات إضافية',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: FilledButton(
                  onPressed: () async {
                    final clientNotifier =
                        ref.read(clientsNotifierProvider.notifier);

                    final newClient = Client(
                      id: null,
                      name: name.text,
                      address: address.text,
                      phoneNumber: phoneNumber.text,
                      extraInfo: extraInfo.text,
                    );

                    await clientNotifier.addClient(newClient);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تمت إضافة الزبون بنجاح')),
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
                    child: Text('حفظ ملف الزبون'),
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
