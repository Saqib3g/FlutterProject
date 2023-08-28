//add  image_picker: ^1.0.2 and firebase_storage: ^11.2.6 in pubspec.yaml file.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:july_batch_flutter/Firebase/uploadFileToFirbase.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _imageFile == null
            ? SizedBox()
            : Image.file(
                File(_imageFile?.path ?? ""),
                width: 200,
                height: 200,
              ),
        TextButton(
            onPressed: () {
              getTheImage();
            },
            child: Text("Take picture")),
        TextButton(
            onPressed: () {
              
              Uint8List bytes = .readAsBytesSync();
              // _imageFile.
              // uploadFileToFirebse();
            },
            child: Text("upload"))
      ]),
    );
  }

  getTheImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      print(pickedFile);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        // _pickImageError = e;
      });
    }
  }
}
