// import 'package:flutter/material.dart';
// import 'widgets/FrontPage.dart'; // Tip: standard Flutter formatting uses snake_case for filenames
// import 'widgets/SplashScreen.dart';

// void main() {
//   runApp(const SpendlyApp());
// }

// /// This widget sets up the overall App shell, including your themes and initial route.
// class SpendlyApp extends StatelessWidget {
//   const SpendlyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Spendly',
//       // We start the app on the Splash Screen
//       home: const SplashScreenLayout(),
//     );
//   }
// }

// /// This widget holds the visual Scaffold shell you built, 
// /// displaying the SplashScreen first while preserving your custom AppBar and Drawer.
// class SplashScreenLayout extends StatelessWidget {
//   const SplashScreenLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 252, 238),
      
//       drawer: const Drawer(
//         child: SafeArea(
//           child: SizedBox(),
//         ),
//       ),
      
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 220, 155, 155),
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text(
//           "Spendly!!",
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//         elevation: 4.0,
//         shadowColor: const Color.fromARGB(0, 117, 117, 238),
//       ),

//       // Displays the splash content. Inside your actual SplashScreen widget,
//       // you should trigger a timer that navigates to FrontPageLayout().
//       body: const SplashScreen(),
//     );
//   }
// }

// /// This is your secondary main layout container. Once the splash screen is done,
// /// you will navigate users here to see the actual content.
// class FrontPageLayout extends StatelessWidget {
//   const FrontPageLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 252, 238),
//       drawer: const Drawer(child: SafeArea(child: SizedBox())),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 220, 155, 155),
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text(
//           "Spendly!!",
//           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: const FrontPage(),
//     );
//   }
// }


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
class FrontPageLayout extends StatelessWidget {
  const FrontPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 238),
      
      // Drawer is now safely attached here
      drawer: const AppDrawer(),
      
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
      
      body: const FrontPage(),
    );
  }
}