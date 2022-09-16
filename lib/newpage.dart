import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  Future addUser()  {
    var users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': "fullName", // John Doe
          'company': "company", // Stokes and Sons
          'age': "age" // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          addUser();
        },
        child: const Text("ADD user"),
      )),
    );
  }
}
