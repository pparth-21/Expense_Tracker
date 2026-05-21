import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'models/expense.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  DateTime? _selectedDate;

  List<Expense> get _filtered {
    if (_selectedDate == null) return exps;
    return exps
        .where(
          (e) =>
              e.date.year == _selectedDate!.year &&
              e.date.month == _selectedDate!.month &&
              e.date.day == _selectedDate!.day,
        )
        .toList();
  }

  double get _total => _filtered.fold(0.0, (sum, e) => sum + e.amount);

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 220, 155, 155),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  void initState() {
    super.initState();
    loadList();
  }

  Future<void> loadList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString('my-list');

      if (jsonString != null) {
        final List<dynamic> decodedList = jsonDecode(jsonString);

        final List<Expense> loadedExpenses = decodedList
            .map((item) => Expense.fromJson(item))
            .toList();

        setState(() {
          exps.clear();
          exps.addAll(loadedExpenses);
        });

        print("Loaded ${exps.length} entries successfully into global list!");
      }
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  Future<void> saveList() async {
    print("hello");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(exps.map((item) => item.toJson()).toList());
    await prefs.setString('my-list', jsonString);
  }

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
    saveList();
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
              saveList();
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
              keyboardType: TextInputType.number,
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
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _addExpenseToList(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  double showAmount() {
    double sum = 0;
    for (int i = 0; i < exps.length; i++) {
      sum += exps[i].amount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC), // Soft background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _pickDate(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFDC9B9B)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xFFDC9B9B),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _selectedDate == null
                                  ? "Filter by Date"
                                  : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                              style: TextStyle(
                                color: _selectedDate == null
                                    ? Colors.grey
                                    : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Clear button
                  if (_selectedDate != null) ...[
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => setState(() => _selectedDate = null),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.redAccent,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 16),
              // STYLED TOTAL AMOUNT CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE8A7A7), Color(0xFFDC9B9B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFDC9B9B).withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TOTAL MONEY SPENT",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "₹${showAmount().toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // LIST SECTION
              Expanded(
                child: ListView.builder(
                  itemCount: exps.length,
                  itemBuilder: (context, index) {
                    final exp = exps[index];
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
                          exp.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "${exp.note.isEmpty ? 'No note' : exp.note}\n${exp.date.toString().substring(0, 10)}",
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
                              "₹${exp.amount.toStringAsFixed(1)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () =>
                                  _showEditExpenseDialog(context, exp, index),
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  exps.remove(exp);
                                });
                                saveList();
                              },
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
        onPressed: () => _showAddExpenseDialog(context),
        backgroundColor: const Color(0xFFDC9B9B),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 6,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
