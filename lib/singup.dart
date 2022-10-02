// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebassapp/login.dart';
import 'package:firebassapp/main_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var repasswordcontroller = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  newaccount() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: usernamecontroller.text, password: passwordcontroller.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: NetworkImage(
                          "https://www.gstatic.com/devrel-devsite/prod/v1a2d2d725c48303ffd65eb7122e57032dbf9bb148227658cacdfddf0dcae1e46/firebase/images/touchicon-180.png")),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: usernamecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: repasswordcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Re-Password',
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      newaccount();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingPage(),
                        ),
                      );
                    },
                    child: const Text("Register!"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Text("Already have an account?!"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
