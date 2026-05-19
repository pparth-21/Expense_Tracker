import 'package:flutter/material.dart';
import 'package:flutter_app_2/main.dart'; // ← change this import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {                              // ← add mounted check
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FrontPageLayout()), // ← change this
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 210, 210),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Version 1.0.0")],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.currency_bitcoin_outlined, size: 100),
                  Text(
                    "Spendly",
                    style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '"WE HELP YOU SPEND WISELY!!:"',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 150),
                  CircularProgressIndicator(
                    color: Color.fromARGB(110, 54, 54, 54),
                  ),
                  SizedBox(height: 20),
                  Text("Loading..."),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text("Copyright © 2026 Spendly. All rights reserved."),
          ),
        ],
      ),
    );
  }
}