import 'package:flutter/material.dart';

class Manavta extends StatefulWidget {
  const Manavta({Key? key}) : super(key: key);

  @override
  _ManavtaState createState() => _ManavtaState();
}

class _ManavtaState extends State<Manavta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manavta"),
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
