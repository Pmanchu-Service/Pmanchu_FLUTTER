import 'package:flutter/material.dart';
import 'package:pmanchu/design/button.dart' as button;
import 'package:pmanchu/design/color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Image.asset("assets/sign_up_banner.png", height: 35),
            const Text("이름을 입력하세요", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 60),
            TextField(
              onChanged: (value)=>setState(() {
                _name = value;
              }),
              maxLength: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: gray1, width: 2)),
                hintText: "이름(본명)을 입력하세요",
                hintStyle: TextStyle(color: gray5)
              )
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: button.PrimaryButton(
                text: "다음",
                onPressed: () {},
                enabled: _name.length >= 2
              )
            ),
            const SizedBox(height: 40)
          ]
        )
      )
    );
  }
}

