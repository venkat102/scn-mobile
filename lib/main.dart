import 'package:flutter/material.dart';
import 'package:scn/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  MaterialColor primaryColor = const MaterialColor(0xFF153b72, <int, Color>{
        50: Color(0xFF153b72),
        100: Color(0xFF153b72),
        200: Color(0xFF153b72),
        300: Color(0xFF153b72),
        400: Color(0xFF153b72),
        500: Color(0xFF153b72),
        600: Color(0xFF153b72),
        700: Color(0xFF153b72),
        800: Color(0xFF153b72),
        900: Color(0xFF153b72),
      },
    );

  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/login.jpg"), context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sri Sakthi Cable',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: primaryColor,
      ),
      home: const Login(),
    );
  }
}