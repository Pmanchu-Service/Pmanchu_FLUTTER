import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class ColoredButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  const ColoredButton({super.key, required this.child, required this.color, required this.onPressed});

  @override
  State<ColoredButton> createState() => _ColoredButtonState();
}
class _ColoredButtonState extends State<ColoredButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: widget.color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4)
              )
            ]
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: widget.child
        )
      )
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;
  const PrimaryButton({super.key, required this.text, required this.onPressed, required this.enabled});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}
class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: widget.enabled,
      onTap: widget.onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: widget.enabled ? main2 : gray4,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4)
              )
            ]
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(child: Text(widget.text, style: const TextStyle(fontSize: 18, color: Colors.white)))
        )
      )
    );
  }
}
