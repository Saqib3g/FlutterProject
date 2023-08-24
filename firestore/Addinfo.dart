//add dependencies 
//flutter pub add cloud_firestore

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Addinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore and SQLite Example',
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
    // final age = int.tryParse(_ageController.text) ?? 0;

    // Store in SQLite
    //await _databaseHelper.insert({'name': name, 'age': age});
    //collection -> studetns
    final studentCollection = FirebaseFirestore.instance.collection("students");//"students" is a collection name here.
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
        .then((value) => print("student data added"))
        .catchError((error) => print("error $error"));

    _nameController.clear();
    _emailController.clear();
    _addressConroler.clear();
    _phoneController.clear();
    _categoryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore and SQLite Example'),
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
          ],
        ),
      ),
    );
  }
}
