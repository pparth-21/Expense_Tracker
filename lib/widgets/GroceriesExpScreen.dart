import 'package:flutter/material.dart';

class GroceriesExpScreen extends StatelessWidget {
  const GroceriesExpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groceries Expenses"),
        backgroundColor: const Color.fromARGB(255, 220, 155, 155),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text("Groceries screen works!"),
      ),
    );
  }
}