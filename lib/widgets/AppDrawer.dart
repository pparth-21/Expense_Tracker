import 'package:flutter/material.dart';
import 'package:flutter_app_2/widgets/models/expense.dart';
import 'HomeExpScreen.dart';
import 'EduExpScreen.dart';
import 'GroceriesExpScreen.dart';

class AppDrawer extends StatelessWidget {
  final List<Expense> expenses;

  const AppDrawer({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
              margin: const EdgeInsets.only(bottom: 20,),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 220, 155, 155),
               
              ),
              child: const Text(
                "FILTER BY CATEGORY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HomeExpScreen(expenses: expenses)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.school_outlined),
              title: const Text("Education"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EduExpScreen(expenses: expenses)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text("Groceries"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => GroceriesExpScreen(expenses: expenses)));
              },
            ),
          ],
        ),
      ),
    );
  }
}