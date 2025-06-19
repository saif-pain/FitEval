import 'package:flutter/material.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int age = 30;
  int weight = 78;
  double heightCm = 175;
  double heightInches = 68.9;
  bool isCm = true;
  String gender = 'Male';

  double calculateBMI() {
    double heightInMeters = heightCm / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Text("BMI CALCULATOR", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // AGE & WEIGHT
                    Row(
                      children: [
                        Expanded(
                          child: buildCounterCard(
                            "Age",
                            age,
                            () => setState(() => age--),
                            () => setState(() => age++),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: buildCounterCard(
                            "Weight (KG)",
                            weight,
                            () => setState(() => weight--),
                            () => setState(() => weight++),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                    // HEIGHT UNIT SELECTION
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text("Height Unit", style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChoiceChip(
                                label: Text("CM"),
                                selected: isCm,
                                selectedColor: Colors.deepPurple.shade100,
                                onSelected: (_) => setState(() => isCm = true),
                              ),
                              SizedBox(width: 10),
                              ChoiceChip(
                                label: Text("Inches"),
                                selected: !isCm,
                                selectedColor: Colors.deepPurple.shade100,
                                onSelected: (_) => setState(() => isCm = false),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Slider(
                            value: isCm ? heightCm : heightInches,
                            min: isCm ? 50 : 20,
                            max: isCm ? 300 : 100,
                            divisions: isCm ? 250 : 80,
                            label: (isCm ? heightCm : heightInches)
                                .toStringAsFixed(0),
                            onChanged: (val) {
                              setState(() {
                                if (isCm) {
                                  heightCm = val;
                                  heightInches = val / 2.54;
                                } else {
                                  heightInches = val;
                                  heightCm = val * 2.54;
                                }
                              });
                            },
                            activeColor: Colors.deepPurple,
                            thumbColor: Colors.white,
                          ),
                          Text(
                            isCm
                                ? '${heightCm.toStringAsFixed(0)} cm'
                                : '${(heightInches ~/ 12)} ft ${(heightInches % 12).toStringAsFixed(0)} in',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    // GENDER SELECTION
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text("Gender", style: TextStyle(fontSize: 18)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ChoiceChip(
                                label: Text("Male"),
                                selected: gender == 'Male',
                                selectedColor: Colors.deepPurple.shade100,
                                onSelected: (_) =>
                                    setState(() => gender = 'Male'),
                              ),
                              SizedBox(width: 16),
                              ChoiceChip(
                                label: Text("Female"),
                                selected: gender == 'Female',
                                selectedColor: Colors.pink.shade100,
                                onSelected: (_) =>
                                    setState(() => gender = 'Female'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CALCULATE BUTTON
            ElevatedButton(
              onPressed: () {
                double bmi = calculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmi: bmi),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: Text(
                "Calculate BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCounterCard(
    String title,
    int value,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.deepPurple.shade100,
                child: IconButton(
                  icon: Icon(Icons.remove, size: 16),
                  onPressed: onDecrement,
                ),
              ),
              SizedBox(width: 12),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(width: 12),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.deepPurple.shade100,
                child: IconButton(
                  icon: Icon(Icons.add, size: 16),
                  onPressed: onIncrement,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
