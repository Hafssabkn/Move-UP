import 'package:flutter/material.dart';
import 'level_screen.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  String? selectedGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "WHAT'S YOUR GOAL?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Choose your most important goal and your\ntrainer will help you achieve it.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Image.asset('assets/images/fitnessicon.png',width: 150),
                  const SizedBox(height: 30),

                  Column(
                    children: [
                      _goalButton(
                        label: "LOSE WEIGHT",
                        value: "lose-weight",
                      ),
                      const SizedBox(height: 16),
                      _goalButton(
                        label: "TIGHTEN YOUR TISSUE",
                        value: "tighten-tissue",
                      ),
                      const SizedBox(height: 16),
                      _goalButton(
                        label: "BUILD MUSCLE",
                        value: "build-muscle",
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedGoal != null
                          ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LevelScreen()),
                        );
                        print('Selected goal: $selectedGoal');
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedGoal != null ? Colors.red : Colors.grey[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _goalButton({required String label, required String value}) {
    final isSelected = selectedGoal == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = value;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.grey[700]
              : Colors.grey[800]?.withOpacity(0.8),
          border: Border.all(
            color: isSelected
                ? Colors.grey[500]!
                : Colors.grey[600]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[300],
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}