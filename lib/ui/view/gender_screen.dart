import 'package:flutter/material.dart';
import '../../service/user_data_service.dart';
import 'goals_screen.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  void _goToNextScreen() {
    if (selectedGender != null) {
      UserDataService.setGender(selectedGender!);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GoalsScreen()),
      );
    }
  }

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
                    "WHAT'S YOUR GENDER?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Your trainer will customize your training\nprogram based on a few questions.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Image.asset('assets/images/fitnessicon.png', width: 150),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _genderButton(
                        icon: Icons.female,
                        label: "Female",
                        value: "female",
                      ),
                      const SizedBox(width: 30),
                      _genderButton(
                        icon: Icons.male,
                        label: "Male",
                        value: "male",
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedGender != null ? _goToNextScreen : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
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

  Widget _genderButton({required IconData icon, required String label, required String value}) {
    final isSelected = selectedGender == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = value;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: isSelected ? Colors.red : Colors.white.withOpacity(0.8),
            child: Icon(
              icon,
              size: 35,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
