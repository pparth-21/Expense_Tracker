import 'package:flutter/material.dart';
import 'package:flutter_app_2/widgets/models/expense.dart';

class EduExpScreen extends StatelessWidget {
  final List<Expense> expenses;

  const EduExpScreen({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final filtered = expenses.where((e) => e.category == "Education").toList();

       return Scaffold(
      appBar: AppBar(
        title: const Text("Education Expenses"),
        backgroundColor: const Color.fromARGB(255, 220, 155, 155),
        foregroundColor: Colors.white,
      ),
      body: filtered.isEmpty
          ? const Center(child: Text("No Education expenses yet!"))
          : ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final exp = filtered[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.currency_rupee_rounded),
                    ),
                    title: Text(exp.category),
                    subtitle: Text("${exp.amount}\n${exp.note}\n${exp.date}"),
                  ),
                );
              },
            ),
    );
  }
}