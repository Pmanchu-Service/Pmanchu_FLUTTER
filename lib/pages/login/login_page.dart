import 'package:flutter/material.dart';
import 'package:pmanchu/design/button.dart' as button;
import 'package:pmanchu/pages/sign_up/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Image.asset("assets/logo_with_text.png", width: 120),
            const SizedBox(height: 12),
            const Text("로그인", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: "깃허브로 ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(text: "프만추", style: TextStyle(color: Color(0xFF74A993), fontWeight: FontWeight.bold)),
                  TextSpan(text: "에 로그인 하세요", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                ]
              )
            ),
            const Spacer(),
            button.ColoredButton(
              color: const Color(0xFF1B1F23),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=>const SignUpPage()
                  )
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/github.png", height: 24),
                  const SizedBox(width: 10),
                  const Text("github로 로그인하기", style: TextStyle(color: Colors.white, fontSize: 16))
                ]
              )
            ),
            const SizedBox(height: 20)
          ]
        )
      )
    );
  }
}
