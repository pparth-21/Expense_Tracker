import 'package:flutter/material.dart';

class HomeExpScreen extends StatelessWidget {
  const HomeExpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Expenses"),
        backgroundColor: const Color.fromARGB(255, 220, 155, 155),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Home screen works!"),
      ),
    );
  }
}