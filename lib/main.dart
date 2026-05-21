
import 'package:flutter/material.dart';
import 'widgets/FrontPage.dart'; 
import 'widgets/SplashScreen.dart';
import 'widgets/AppDrawer.dart';
import 'package:flutter_app_2/widgets/models/expense.dart';
void main() {
  runApp(const SpendlyApp());
}

class SpendlyApp extends StatelessWidget {
  const SpendlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spendly',
      home: const SplashScreenLayout(),
    );
  }
}

/// 1. SPLASH SCREEN LAYOUT (Clean, no AppBar or Drawer)
class SplashScreenLayout extends StatelessWidget {
  const SplashScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 252, 238),
      // Clean canvas for your splash content to render full-screen
      body: SplashScreen(),
    );
  }
}

/// 2. FRONT PAGE LAYOUT (Now includes your customized AppBar and Drawer)
class FrontPageLayout extends StatefulWidget {
  const FrontPageLayout({super.key});

  @override
  State<FrontPageLayout> createState() => _FrontPageLayoutState();
}

class _FrontPageLayoutState extends State<FrontPageLayout> {
  final List<Expense> _expenses = [];

  void _addExpense(Expense e) {
    setState(() => _expenses.add(e));
  }

  void _deleteExpense(int index) {
    setState(() => _expenses.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 238),
      
      // Drawer is now safely attached here
      drawer: AppDrawer(expenses: _expenses),
      
      // AppBar moved here with all your exact custom styling intact
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 155, 155),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Spendly!!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 4.0,
        shadowColor: const Color.fromARGB(0, 117, 117, 238),
      ),
      
      body: FrontPage(expenses: _expenses,
        onAdd: _addExpense,
        onDelete: _deleteExpense,
      ),
    );
  }
}