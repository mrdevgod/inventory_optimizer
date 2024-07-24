import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  final String appBarTitle;

  const MainAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: const TextStyle(fontFamily: 'NotoKufiArabic'),
      ),
      backgroundColor: Colors.blueAccent,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
