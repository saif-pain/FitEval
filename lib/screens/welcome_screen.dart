import 'package:flutter/material.dart';
import 'input_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF736EFE),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/bike.png", height: 200),
              SizedBox(height: 40),
              Text(
                'FitEval',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Get Started with\nTracking Your Health!',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12), // spacing between texts
              Text(
                'Calculate your BMI and stay on top of your wellness journey, effortlessly.',
                style: TextStyle(color: Colors.white60, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputScreen()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xFF736EFE),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
