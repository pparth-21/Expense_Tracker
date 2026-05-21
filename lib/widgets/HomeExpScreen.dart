import 'package:flutter/material.dart';
import 'models/expense.dart';

class HomeExpScreen extends StatefulWidget {
  const HomeExpScreen({super.key});

  @override
  State<HomeExpScreen> createState() => _HomeExpScreenState();
}

String target = "Home";
List<Expense> homeExpenses = exps.where((e) {
  return e.category.toLowerCase() == target.toLowerCase();
}).toList();

class _HomeExpScreenState extends State<HomeExpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Expenses"),
        backgroundColor: const Color.fromARGB(255, 220, 155, 155),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: homeExpenses.length,
                  itemBuilder: (context, index) {
                    final expense = homeExpenses[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: const Border(
                          left: BorderSide(color: Color(0xFFDC9B9B), width: 5),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFFBEBEB),
                          foregroundColor: Color(0xFFDC9B9B),
                          child: Icon(Icons.currency_rupee_rounded),
                        ),
                        title: Text(
                          expense.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "${expense.note.isEmpty ? 'No note' : expense.note}\n${expense.date.toString().substring(0, 10)}",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              height: 1.3,
                            ),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "₹${expense.amount.toStringAsFixed(1)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFDC9B9B),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 6,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
