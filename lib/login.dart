import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebassapp/main_screen.dart';
import 'package:firebassapp/singup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


   FirebaseAuth auth = FirebaseAuth.instance;

    signUp(email, password) async {
      await auth.signInWithEmailAndPassword(email: email, password: password);

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            const Image(
                image: NetworkImage(
                    "https://www.gstatic.com/devrel-devsite/prod/v1a2d2d725c48303ffd65eb7122e57032dbf9bb148227658cacdfddf0dcae1e46/firebase/images/touchicon-180.png")),
            const Text(
              "FireBase Login",
              style: TextStyle(color: Colors.blue, fontSize: 21),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: usernamecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
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
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingPage(),
                  ),
                );
              },
              child: Text("Login"),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text("Not yet a member? Sign up!")),
            ),
          ]),
        ),
      ),
    );
  }
}


// Container(
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'User Name',
//                   ),
//                 ),
//               ),
