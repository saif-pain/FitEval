import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(BMiDOApp());

class BMiDOApp extends StatelessWidget {
  const BMiDOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitEval',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFFF4F4FC),
        fontFamily: 'Arial',
      ),
      home: WelcomeScreen(),
    );
  }
}
