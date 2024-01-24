import 'package:flutter/material.dart';

class Goa extends StatefulWidget {
  const Goa({Key? key}) : super(key: key);

  @override
  _GoaState createState() => _GoaState();
}

class _GoaState extends State<Goa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Goa Talent Bank"),
      backgroundColor: Color.fromARGB(255, 227, 60, 9), ),
      
      body: Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
