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
  Map<String, dynamic> toJson(){
    return {
      "amount": amount,
      "category": category,
      "note": note,
      "date": date,
    };
  }
}
List<Expense> exps = [];
TextEditingController amountI = TextEditingController();
TextEditingController categoryI = TextEditingController();
TextEditingController noteI = TextEditingController();