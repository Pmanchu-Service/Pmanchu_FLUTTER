import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class InputText extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final int? maxLength;
  final String placeholder;
  final int? defaultLine;
  const InputText({super.key, this.onChanged, this.onSubmitted, this.controller, this.maxLength, this.placeholder = "", this.defaultLine});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged??(_){},
      onSubmitted: widget.onSubmitted??(_){},
      maxLength: widget.maxLength,
      cursorColor: Colors.black,
      cursorWidth: 1,
      cursorHeight: 16,
      maxLines: (widget.defaultLine != null) ? null : 1,
      minLines: widget.defaultLine,
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
