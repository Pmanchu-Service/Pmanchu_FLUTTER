import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pmanchu/design/button.dart';
import 'package:pmanchu/pages/sign_up/steps/sign_up_step_name.dart';
import 'package:pmanchu/pages/sign_up/steps/sign_up_step_introduce.dart';
import 'package:pmanchu/pages/sign_up/steps/sign_up_step_stack.dart';
import 'package:pmanchu/pages/sign_up/steps/sign_up_step_major.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final PageController _controller = PageController();
  final List<String> _titles = [
    "이름을 입력하세요",
    "자기소개를 입력하세요",
    "기술스택을 입력하세요",
    "전공을 선택하세요"
  ];
  int _currentPage = 0;
  String _name = "";
  File? _image;
  String _introduceTitle = "";
  String _introduceContent = "";
  final List<String> _stacks = [];
  Map<String, bool> _majors = {};

  bool _getCondition() {
    switch (_currentPage) {
      case 0:
        return _name.length >= 2;
      case 1:
        return _introduceTitle.isNotEmpty;
      case 2:
        return _stacks.isNotEmpty;
      case 3:
        return _majors.values.contains(true);
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Image.asset("assets/sign_up_banner.png", width: 210),
            Text(_titles[_currentPage], style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 80),
            Expanded(child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SignUpStepName(
                  onNameChanged: (value) => setState(() {
                    _name = value;
                  }),
                  onImageChanged: (value) => setState(() {
                    _image = value;
                  })
                ),
                SignUpStepIntroduce(
                  onTitleChanged: (value) => setState(() {
                    _introduceTitle = value;
                  }),
                  onContentChanged: (value) => setState(() {
                    _introduceContent = value;
                  })
                ),
                SignUpStepStack(
                  stacks: _stacks,
                  addItem: (value) => setState(() {
                    _stacks.add(value);
                  }),
                  removeItem: (index) => setState(() {
                    _stacks.removeAt(index);
                  })
                ),
                SignUpStepMajor(onChanged: (value) => setState(() {
                  _majors = value;
                }))
              ]
            )),
            const Spacer(),
            PrimaryButton(
              onPressed: _currentPage == 3 ?
              () {
                // Navigator
              } :
              () {
                setState(() {
                  _currentPage++;
                });
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              text: _currentPage == 3 ? '끝내기' : '다음',
              enabled: _getCondition()
            )
          ]
        )
      )
    );
  }
}

