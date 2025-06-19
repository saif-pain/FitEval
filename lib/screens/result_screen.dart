import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  const ResultScreen({super.key, required this.bmi});

  String getBMICategory() {
    if (bmi < 18.5) {
      return "UNDERWEIGHT";
    } else if (bmi < 25) {
      return "NORMAL BMI";
    } else if (bmi < 30) {
      return "OVERWEIGHT";
    } else {
      return "OBESITY";
    }
  }

  String getBMIDetails() {
    return '''
Underweight: BMI < 18.5
Normal: 18.5–24.9
Overweight: 25–29.9
Obesity: 30+
''';
  }

  Future<void> saveBMI(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('last_bmi', bmi.toStringAsFixed(2));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("BMI Saved Locally!"),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = getBMICategory();

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Body Mass Index",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Column(
                  children: [
                    Text(
                      bmi.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      getBMIDetails(),
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => saveBMI(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: Text(
                  "Save the results",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
