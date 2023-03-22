import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? image;

  /// Get image
  Future _pickImage(ImageSource source) async {
    try {
      final XFile? imageFile = await ImagePicker().pickImage(source: source);
      if (imageFile == null) return;
      final File img = File(imageFile.path);
      setState(() {
        image = img;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: MaterialButton(
                  height: 50.0,
                  elevation: 5,
                  color: Colors.blue,
                  child: const Text("Pick Image from Gallery"),
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ),
              MaterialButton(
                height: 50.0,
                elevation: 5,
                color: Colors.blue,
                child: const Text("Pick Image from Camera"),
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: image == null
                    ? const Text("Not find image Path")
                    : Container(
                        height: 500.0,
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
