import 'package:flutter/material.dart';

class EduExpScreen extends StatelessWidget {
  const EduExpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education Expenses"),
        backgroundColor: const Color.fromARGB(255, 220, 155, 155),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Education screen works!"),
      ),
    );
  }
}