import 'package:flutter/material.dart';
import 'Widgets/FrontPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 252, 238),

        drawer: const Drawer(child: SafeArea(child: SizedBox())),

        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 220, 155, 155),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Spendly!!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          elevation: 4.0,
          shadowColor: const Color.fromARGB(0, 117, 117, 238),
        ),

        body: FrontPage(),
        ),
      ),
    
  );
}
