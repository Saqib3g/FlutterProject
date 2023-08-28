import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

uploadFileToFirebse(Uint8List filePath) async {
// Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();
  // UploadTask uploadTaks = storageRef.putFile(File(filePath));

  // print(uploadTaks.storage.ref());
  try {
    await storageRef.putData(filePath);
  } catch (e) {
    // ...
    print(e);
  }
}
