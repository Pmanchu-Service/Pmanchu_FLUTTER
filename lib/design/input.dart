import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class InputText extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final int? maxLength;
  final String placeholder;
  final int? defaultLine;
  final BorderRadius radius;
  final EdgeInsets padding;
  final double? lineHeight;
  final Widget? prefixIcon;
  const InputText({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.maxLength,
    this.placeholder = "",
    this.defaultLine,
    this.radius = const BorderRadius.all(Radius.circular(5)),
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    this.lineHeight,
    this.prefixIcon
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        selectionColor: main3.withOpacity(0.5),
        selectionHandleColor: main2
      ),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged??(_){},
        onSubmitted: widget.onSubmitted??(_){},
        maxLength: widget.maxLength,
        cursorColor: Colors.black,
        cursorWidth: 1,
        cursorHeight: 16,
        maxLines: (widget.defaultLine != null) ? null : 1,
        minLines: widget.defaultLine,
        style: TextStyle(height: widget.lineHeight),
        decoration: InputDecoration(
          filled: true,
          fillColor: gray1,
          hoverColor: gray1,
          isDense: true,
          prefixIcon: widget.prefixIcon,
          contentPadding: widget.padding,
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: gray2, width: 2), borderRadius: widget.radius),
          border: OutlineInputBorder(borderSide: const BorderSide(color: gray2, width: 2), borderRadius: widget.radius),
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: gray2, width: 2), borderRadius: widget.radius),
          hintText: widget.placeholder,
          hintStyle: const TextStyle(color: gray3),
          counterText: ''
        )
      )
    );
  }
}
