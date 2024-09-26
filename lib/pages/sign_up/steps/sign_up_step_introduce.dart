import 'package:flutter/material.dart';
import 'package:pmanchu/design/input.dart';

class SignUpStepIntroduce extends StatefulWidget {
  final void Function(String) onTitleChanged;
  final void Function(String) onContentChanged;
  const SignUpStepIntroduce({super.key, required this.onTitleChanged, required this.onContentChanged});

  @override
  State<SignUpStepIntroduce> createState() => _SignUpStepIntroduceState();
}

class _SignUpStepIntroduceState extends State<SignUpStepIntroduce> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputText(
          onChanged: widget.onTitleChanged,
          placeholder: '한 줄로 자기소개를 해주세요'
        ),
        const SizedBox(height: 20),
        Expanded(
          child: InputText(
            onChanged: widget.onContentChanged,
            placeholder: '구체적으로 자기소개를 해주세요',
            defaultLine: 6
          )
        )
      ]
    );
  }
}
