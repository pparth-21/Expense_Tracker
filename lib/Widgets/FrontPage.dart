import 'package:flutter/material.dart';

class Expense {
  final double amount;
  final String category;
  final String note;
  final DateTime date;

  Expense({
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
  });
}

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<Expense> exps = [];
  TextEditingController amountI = TextEditingController();
  TextEditingController categoryI = TextEditingController();
  TextEditingController noteI = TextEditingController();
  void _addExpenseToList(BuildContext context) {
    String rawAmount = amountI.text;
    double dAmount = double.tryParse(rawAmount) ?? 0.0;
    setState(() {
      exps.add(
        Expense(
          amount: dAmount,
          category: categoryI.text,
          note: noteI.text,
          date: DateTime.now(),
        ),
      );
    });
    amountI.clear();
    categoryI.clear();
    noteI.clear();
    Navigator.of(context).pop();
  }

  void _showEditExpenseDialog(BuildContext context, Expense e, int index) {
    amountI.text = e.amount.toString();
    categoryI.text = e.category;
    noteI.text = e.note;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Edit Expense!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Enter amount",
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              controller: amountI,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Enter category",
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              controller: categoryI,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Enter a note",
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
              controller: noteI,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              amountI.clear();
              categoryI.clear();
              noteI.clear();
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                exps[index] = Expense(
                  amount: double.tryParse(amountI.text) ?? e.amount,
                  category: categoryI.text.isEmpty
                      ? e.category
                      : categoryI.text,
                  note: noteI.text.isEmpty ? e.note : noteI.text,
                  date: e.date,
                );
                amountI.clear();
                categoryI.clear();
                noteI.clear();
              });
              Navigator.pop(context);
            },
            child: const Text("Edit"),
          ),
        ],
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add Expense!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Enter amount"),
              controller: amountI,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Enter category"),
              controller: categoryI,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Enter a note"),
              controller: noteI,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              amountI.clear();
              categoryI.clear();
              noteI.clear();
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => _addExpenseToList(context),
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(30),
          child: Column(
            spacing: 30,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: exps.length,
                  itemBuilder: (context, index) {
                    final exp = exps[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          left: BorderSide(color: Color(0xFFDC9B9B), width: 4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.currency_rupee_rounded),
                        ),
                        title: Text(exp.category),
                        subtitle: Text(
                          "${exp.amount}\n${exp.note}\n${exp.date}",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _showEditExpenseDialog(context, exp, index);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  exps.remove(exp);
                                });
                              },
                              icon: Icon(Icons.delete),
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

        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () => _showAddExpenseDialog(context),
            backgroundColor: const Color.fromARGB(255, 220, 155, 155),
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            elevation: 6,
            child: const Icon(Icons.add, size: 28),
          ),
        ),
      ],
    );
  }
}
