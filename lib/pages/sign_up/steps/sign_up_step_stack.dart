import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';
import 'package:pmanchu/design/input.dart';

class SignUpStepStack extends StatefulWidget {
  final List<String> stacks;
  final void Function(String) addItem;
  final void Function(int) removeItem;
  const SignUpStepStack({super.key, required this.stacks, required this.addItem, required this.removeItem});

  @override
  SignUpStepStackState createState() => SignUpStepStackState();
}

class SignUpStepStackState extends State<SignUpStepStack> {
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      widget.addItem(_controller.text);
      _controller.clear();
    }
  }
  void _removeItem(int index) => widget.removeItem(index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InputText(
                controller: _controller,
                placeholder: '기술 스택을 입력하세요',
                onSubmitted: (_)=>_addItem()
              )
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _addItem,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: main2,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50
                )
              )
            )
          ]
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: widget.stacks.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: gray2, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.stacks[index],
                        style: const TextStyle(fontSize: 16, color: Colors.black)
                      ),
                      GestureDetector(
                        onTap: () => _removeItem(index),
                        child: const Icon(Icons.close, color: Colors.black)
                      )
                    ]
                  )
                )
              );
            }
          )
        )
      ]
    );
  }
}