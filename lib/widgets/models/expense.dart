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
  factory Expense.fromJson(Map<String, dynamic> json){
    return Expense(
      amount: json['amount'] as double,
      category: json['category'] as String,
      note: json['note'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }
  Map<String, dynamic> toJson(){
    return {
      "amount": amount,
      "category": category,
      "note": note,
      "date": date.toIso8601String(),
    };
  }
  
}
List<Expense> exps = [];
TextEditingController amountI = TextEditingController();
TextEditingController categoryI = TextEditingController();
TextEditingController noteI = TextEditingController();