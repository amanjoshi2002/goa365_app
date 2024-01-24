import 'package:flutter/material.dart';

class GoaHappenings extends StatefulWidget {
  const GoaHappenings({Key? key}) : super(key: key);

  @override
  _GoaHappeningsState createState() => _GoaHappeningsState();
}

class _GoaHappeningsState extends State<GoaHappenings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goa Happenings 365"),
        backgroundColor: Color.fromARGB(255, 227, 60, 9), // Set the background color to orange
      ),
 
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
