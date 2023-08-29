import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

uploadFileToFirebse(String filePath) async {
// Create a storage reference from our app
  print("file path $filePath");
  final storageRef = FirebaseStorage.instance.ref();

  UploadTask uploadTask = storageRef.putFile(File(filePath));
  final metadata = SettableMetadata(
    contentType: 'image/jpeg',
    // contentType: 'image/png',
    customMetadata: {'picked-file-path': filePath},
  );
  // print(uploadTaks.storage.ref());
  try {
    uploadTask =
        storageRef.putData(await File(filePath).readAsBytes(), metadata);
    //TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    final imgUrl = await (await uploadTask).ref.getDownloadURL();
    print("image url $imgUrl");
  } on FirebaseException catch (e) {
    // ...
    print(e.message);
  }
}
