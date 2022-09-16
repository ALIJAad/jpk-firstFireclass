import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        Container(
          height: 200.0,
          width: 200.0,
          color: Colors.green,
        ),
      ]),
    );
  }
}
