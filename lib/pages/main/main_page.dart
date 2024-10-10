import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';
import 'package:pmanchu/design/input.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: system3,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/logo_with_text.png',
          height: 30
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/alert.png',
              height: 25
            )
          ),
          const SizedBox(width: 25),
        ]
      ),
      body: Column(
        children: [
          InputText()
        ]
      )
    );
  }
}
