import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';

class SignUpStepMajor extends StatefulWidget {
  final void Function(Map<String, bool>) onChanged;
  const SignUpStepMajor({super.key, required this.onChanged});

  @override
  SignUpStepMajorState createState() => SignUpStepMajorState();
}

class SignUpStepMajorState extends State<SignUpStepMajor> {
  Map<String, bool> items = {
    'Front-end': false,
    'Embedded': false,
    'Back-end': false,
    'Game': false,
    'DevOps': false,
    'Design': false,
    'iOS': false,
    'Security': false,
    'AOS': false,
    'AI': false,
    'Flutter': false
  };

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 2.0,
      childAspectRatio: 4,
      children: items.keys.map((category) {
        return Row(
          children: [
            Checkbox(
              value: items[category],
              activeColor: main4,
              checkColor: Colors.white,
              side: BorderSide(
                color: items[category]! ? main4 : Colors.grey,
                width: 2
              ),
              onChanged: (bool? value) {
                setState(() {
                  items[category] = value!;
                });
                widget.onChanged(items);
              }
            ),
            Text(category)
          ]
        );
      }).toList(),
    );
  }
}
