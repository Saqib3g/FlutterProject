//https://firebase.flutter.dev/docs/firestore/usage#removing-data

//add dependencies 
//flutter pub add cloud_firestore

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Addinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressConroler = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _submitForm() async {
    final name = _nameController.text;
    final studentCollection = FirebaseFirestore.instance.collection("students");
    //create save  payload
    final studentsData = {
      "name": _nameController.text,
      "category": _categoryController.text,
      "email": _emailController.text,
      "isPaid": false,
      "phone": _phoneController.text,
      "address": _addressConroler.text
    };
    studentCollection
        .add(studentsData)
        .then((value) => print("student added"))
        .catchError((error) => print("error $error"));

    _nameController.clear();
    _emailController.clear();
    _addressConroler.clear();
    _phoneController.clear();
    _categoryController.clear();
  }

  deleteTheData() {
    //  delete record
    FirebaseFirestore.instance
        .collection('students')
        .doc("PPAlVALEekjO27h8Yube")
        .delete()
      ..then((value) => print("deleted the data"))
          .catchError((error) => print("Failed to delete the data: $error"));
  }

  //update record

  updateTheData() {
    FirebaseFirestore.instance
        .collection('students')
        .doc("3vm7bCwvro69WYvjMRhU")
        .update({"name": "sukesh1"})
      ..then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
  }

//Get the total data from collection of students
  getTheData() {
    FirebaseFirestore.instance
        .collection('students')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc);
        print(doc["name"]);
        print(doc["email"]);
        print(doc["phone"]);
        print(doc["address"]);
      });
    });
  }

  //Get the data based on condtion
  //.where("name",isEqualTo: "sukesh")

  // FirebaseFirestore.instance
  //     .collection('students')
  //     .where("name", isEqualTo: "sukesh")
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     print(doc);
  //     print(doc["name"]);
  //     print(doc["email"]);
  //     print(doc["phone"]);
  //     print(doc["address"]);
  //   });
  // });
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              // keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _addressConroler,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'category'),
              // keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              // keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: getTheData,
              child: Text('Get the Data'),
            ),
            ElevatedButton(
              onPressed: deleteTheData,
              child: Text('Delete'),
            ),
            ElevatedButton(
              onPressed: updateTheData,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}

//import the file in main.dart , add route and Run.
//open -a simulator
//flutter run 
