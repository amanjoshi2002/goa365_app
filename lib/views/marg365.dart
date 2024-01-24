import 'package:flutter/material.dart';

class Marg365 extends StatefulWidget {
  const Marg365({Key? key}) : super(key: key);

  @override
  _Marg365State createState() => _Marg365State();
}

class _Marg365State extends State<Marg365> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marg365"),
       backgroundColor: Color.fromARGB(255, 240, 76, 11),),
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(
            fontSize: 36, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
