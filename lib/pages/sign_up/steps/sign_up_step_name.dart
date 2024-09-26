import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pmanchu/design/input.dart';
import 'package:pmanchu/design/image_picker.dart';

class SignUpStepName extends StatefulWidget {
  final void Function(String) onNameChanged;
  final void Function(File?) onImageChanged;
  const SignUpStepName({super.key, required this.onNameChanged, required this.onImageChanged});

  @override
  State<SignUpStepName> createState() => _SignUpStepNameState();
}

class _SignUpStepNameState extends State<SignUpStepName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularImagePicker(onImageChanged: widget.onImageChanged),
        const SizedBox(height: 20),
        InputText(
          onChanged: widget.onNameChanged,
          maxLength: 4,
          placeholder: '이름(본명)을 입력하세요'
        )
      ]
    );
  }
}
