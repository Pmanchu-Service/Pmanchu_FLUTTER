import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pmanchu/design/color.dart';
import 'package:image_picker/image_picker.dart';

class CircularImagePicker extends StatefulWidget {
  final void Function(File?) onImageChanged;
  const CircularImagePicker({super.key, required this.onImageChanged});

  @override
  CircularImagePickerState createState() => CircularImagePickerState();
}

class CircularImagePickerState extends State<CircularImagePicker> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        widget.onImageChanged(_imageFile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: _imageFile == null ? Border.all(color: main2, width: 5) : Border.all(color: Colors.transparent, width: 0),
            ),
            child: ClipOval(
              child: _imageFile == null
              ? Image.asset('assets/mandu.png', fit: BoxFit.cover)
              : Image.file(_imageFile!, fit: BoxFit.cover)
            )
          ),
          if (_imageFile == null) Positioned(
            width: 120,
            height: 120,
            child: GestureDetector(
              onTap: _pickImage,
              child: Image.asset(
                'assets/camera.png',
                color: const Color(0xFF757575),
                width: 80,
                height: 80
              )
            )
          )
        ]
      )
    );
  }
}
