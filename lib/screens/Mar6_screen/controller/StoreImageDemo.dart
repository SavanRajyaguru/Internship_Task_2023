import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StoreImageDemo {

  final Reference storageReference = FirebaseStorage.instance.ref();


  // Get Image
  Future getImagePath(ImageSource source) async{
    try {
      final XFile? imageFile = await ImagePicker().pickImage(source: source);
      if(imageFile == null){
        print(imageFile);
        print("Not Selected from imageFile");
        return;
      }
      final File img = File(imageFile.path);
      final imgName = imageFile.name;
      print("PATH+++++ $img");
      print("FILE+++++ $imgName");

      await uploadFile(imgName, img.toString()).then((value) => print('Done'));

    } on PlatformException catch (e) {
      print(e);
    }
  }

  // Implement File picker demo
  Future filePicker() async{
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );
    if(result == null){
      print(result);
      print("Not Selected from fileStorage");
      return;
    }
    final path = result.files.single.path;
    final fileName = result.files.single.name;
    print("PATH>>>> $path");
    print("FILE>>>> $fileName");

    await uploadFile(fileName, path.toString()).then((value) => {
      downloadUrl(value),
      print("DONE>>> $value")
    });

  }

  // upload files in the firebase
  Future<String> uploadFile(String fileName, String filePath) async{
    File file = File(filePath);
    Reference ref = storageReference.child('test');
    try {
      await ref.child(fileName).putFile(file);
    } on FirebaseException catch(e){
      print(e);
    }
    return fileName;
  }

  // download url
  Future<String> downloadUrl(String imageName) async{
    String downloadUrl = await storageReference.child('test').child(imageName).getDownloadURL();
    print("URL>>>> $downloadUrl");
    return downloadUrl;
  }
}