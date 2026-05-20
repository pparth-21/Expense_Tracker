import 'package:flutter/material.dart';
import 'models/expense.dart';
import 'package:flutter_app_2/widgets/HomeExpScreen.dart';
import 'package:flutter_app_2/widgets/EduExpScreen.dart';
import 'package:flutter_app_2/widgets/GroceriesExpScreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: SafeArea(
        child: Column(
          
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              margin: const EdgeInsets.only(bottom: 20, ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 220, 155, 155),
              
              ),
              child: const Text(
                "FILTER BY CATEGORY",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 253, 253),
                  fontSize: 25,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeExpScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online_outlined),
              title: const Text("Education"),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EduExpScreen(),
                  ),
                );
              },
            ),ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text("Groceries"),
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GroceriesExpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}