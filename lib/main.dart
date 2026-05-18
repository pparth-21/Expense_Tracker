import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 252, 238),
        
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 220, 155, 155),
          foregroundColor: Colors.white,
          title: Text(
            "AppBar",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          leading: Icon(Icons.menu),
          elevation: 4.0,
          shadowColor: Color.fromARGB(0, 117, 117, 238),
        ),
      ),
    ),
  );
}
