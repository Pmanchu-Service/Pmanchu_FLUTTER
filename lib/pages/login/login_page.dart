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
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Image.asset("assets/logo_with_text.png", width: 180),
              const SizedBox(height: 18),
              const Text("로그인", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: "깃허브로 ", style: TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(text: "프만추", style: TextStyle(color: Color(0xFF74A993), fontSize: 20)),
                    TextSpan(text: "에 로그인 하세요", style: TextStyle(color: Colors.black, fontSize: 20))
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
      )
    );
  }
}
