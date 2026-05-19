import 'package:flutter/material.dart';
import 'package:flutter_app_2/widgets/SplashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 252, 238),
        body: SplashScreen(),
      
      ),
    ),
  );
}
