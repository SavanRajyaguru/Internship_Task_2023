import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/screens/Mar6_screen/controller/StoreImageDemo.dart';

class ImageStorageDemo extends StatelessWidget {
  const ImageStorageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StoreImageDemo storeImageDemo = StoreImageDemo();
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
                  child: const Text("Upload File"),
                  onPressed: () {
                    storeImageDemo.filePicker();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: MaterialButton(
                  height: 50.0,
                  elevation: 5,
                  color: Colors.blue,
                  child: const Text("Image Picker"),
                  onPressed: () {
                    storeImageDemo.getImagePath(ImageSource.gallery);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
