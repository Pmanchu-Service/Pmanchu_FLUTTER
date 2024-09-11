import 'package:flutter/material.dart';
import 'package:pmanchu/design/button.dart';
import 'package:pmanchu/pages/sign_up/steps/sign_up_step_name.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final List<String> _titles = [
    "이름을 입력하세요",
    "자기소개를 입력하세요",
    "기술스택을 입력하세요",
    "전공을 선택하세요"
  ];
  int _currentIdx = 0;
  String _name = "";

  bool _getCondition(int index) {
    if (index == 0) {
      return _name.length >= 2;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Image.asset("assets/sign_up_banner.png", height: 35),
            Text(_titles[_currentIdx], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 80),
            Builder(
              builder: (context) {
                if (_currentIdx == 0) {
                  return SignUpStepName(
                    onChanged: (value)=>setState(() {
                      _name = value;
                    })
                  );
                }
                return const SizedBox();
              }
            ),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: PrimaryButton(
                text: "다음",
                onPressed: () {},
                enabled: _getCondition(_currentIdx)
              )
            ),
            const SizedBox(height: 40)
          ]
        )
      )
    );
  }
}

