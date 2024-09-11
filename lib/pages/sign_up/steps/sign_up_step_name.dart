import 'package:flutter/material.dart';
import 'package:pmanchu/design/input.dart';

class SignUpStepName extends StatefulWidget {
  final void Function(String) onChanged;
  const SignUpStepName({super.key, required this.onChanged});

  @override
  State<SignUpStepName> createState() => _SignUpStepNameState();
}

class _SignUpStepNameState extends State<SignUpStepName> {
  @override
  Widget build(BuildContext context) {
    return InputText(
      onChanged: widget.onChanged,
      maxLength: 4,
      placeholder: '이름(본명)을 입력하세요'
    );
  }
}
