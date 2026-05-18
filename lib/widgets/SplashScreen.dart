import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255,255,255),
            Color.fromARGB(255, 255,210,210),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Version 1.0.0")],
          ),
          Expanded(child: SizedBox(

          )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  "WE HELP YOU SPEND WISELY!!",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10,),
                
                CircularProgressIndicator(
                  color: const Color.fromARGB(110, 54, 54, 54),
                ),
              ],
            ),
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Copyright © 2026 Spendly. All rights reserved."),
            ],
          ))
        ],
      ),
    );
  }
}
