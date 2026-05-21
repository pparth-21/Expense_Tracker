
import 'package:flutter/material.dart';
import 'widgets/FrontPage.dart'; 
import 'widgets/SplashScreen.dart';
import 'widgets/AppDrawer.dart';
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


class SplashScreenLayout extends StatelessWidget {
  const SplashScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 252, 238),
    
      body: SplashScreen(),
    );
  }
}


class FrontPageLayout extends StatelessWidget {
  const FrontPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 238),
      
     
      drawer: const AppDrawer(),
      
     
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 155, 155),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Spendly!!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        elevation: 4.0,
        shadowColor: const Color.fromARGB(0, 117, 117, 238),
      ),
      
      body: const FrontPage(),
    );
  }
}