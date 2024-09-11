import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class InputText extends StatefulWidget {
  final void Function(String) onChanged;
  final int? maxLength;
  final String placeholder;
  const InputText({super.key, required this.onChanged, required this.maxLength, required this.placeholder});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      cursorColor: Colors.black,
      cursorWidth: 1,
      cursorHeight: 16,
      decoration: InputDecoration(
        filled: true,
        fillColor: gray1,
        hoverColor: gray1,
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: gray2, width: 2)),
        border: const OutlineInputBorder(borderSide: BorderSide(color: gray2, width: 2)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: gray2, width: 2)),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: gray5),
        counterText: ''
      )
    );
  }
}
