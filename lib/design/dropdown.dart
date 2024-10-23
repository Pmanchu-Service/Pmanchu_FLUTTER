import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class SimpleDropdown extends StatefulWidget {
  final List<String> options;
  final void Function(String?) onSelect;

  const SimpleDropdown({super.key, required this.options, required this.onSelect});

  @override
  State<SimpleDropdown> createState() => _SimpleDropdownState();
}

class _SimpleDropdownState extends State<SimpleDropdown> {
  String? _selectedValue;

  void _selectOption(String? value) {
    setState(() {
      _selectedValue = value;
    });
    widget.onSelect(_selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: PopupMenuButton<String>(
        tooltip: "",
        padding: EdgeInsets.zero,
        onSelected: _selectOption,
        menuPadding: EdgeInsets.zero,
        itemBuilder: (BuildContext context) {
          return widget.options.map((String option) {
            return PopupMenuItem<String>(
              padding: EdgeInsets.zero,
              value: option,
              height: 20,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Text(option)
              )
            );
          }).toList();
        },
        offset: const Offset(0, 0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.transparent
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _selectedValue ?? widget.options.first,
                style: const TextStyle(
                  color: gray8
                )
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: gray8
              )
            ]
          )
        )
      )
    );
  }
}
