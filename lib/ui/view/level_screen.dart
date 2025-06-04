import 'package:flutter/material.dart';
import '../../service/user_data_service.dart';
import 'more_information.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  int? selectedLevel;

  final List<Map<String, dynamic>> fitnessLevels = [
    {'level': 1, 'height': 30.0, 'label': 'Beginner'},
    {'level': 2, 'height': 50.0, 'label': 'Novice'},
    {'level': 3, 'height': 70.0, 'label': 'Intermediate'},
    {'level': 4, 'height': 90.0, 'label': 'Advanced'},
    {'level': 5, 'height': 110.0, 'label': 'Expert'},
  ];

  void _goToNextScreen() {
    if (selectedLevel != null) {
      UserDataService.setFitnessLevel(selectedLevel!);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MoreInformationScreen()),
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
                    "WHAT'S YOUR FITNESS LEVEL?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Choose the description that best suits you.\nYour trainer will design a program for you\nwith the appropriate difficulty level.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Image.asset('assets/images/fitnessicon.png', width: 150),
                  const SizedBox(height: 40),

                  Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: fitnessLevels.map((levelData) {
                        final level = levelData['level'] as int;
                        final height = levelData['height'] as double;
                        final isSelected = selectedLevel == level;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedLevel = level;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: height,
                            decoration: BoxDecoration(
                              color: (selectedLevel != null && level <= selectedLevel!)
                                  ? Colors.red
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Container(
                    height: 60,
                    child: selectedLevel != null
                        ? Column(
                      children: [
                        Text(
                          _getLevelTitle(selectedLevel!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getLevelDescription(selectedLevel!),
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                        : const Text(
                      "Select your fitness level above",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedLevel != null ? _goToNextScreen : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        selectedLevel != null ? Colors.red : Colors.grey[700],
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

  String _getLevelTitle(int level) {
    switch (level) {
      case 1:
        return "Beginner";
      case 2:
        return "Novice";
      case 3:
        return "Intermediate";
      case 4:
        return "Advanced";
      case 5:
        return "Expert";
      default:
        return "";
    }
  }

  String _getLevelDescription(int level) {
    switch (level) {
      case 1:
        return "New to fitness or returning after a long break";
      case 2:
        return "Some experience with basic exercises";
      case 3:
        return "Regular workout routine, moderate experience";
      case 4:
        return "Consistent training, good form and technique";
      case 5:
        return "Extensive experience, advanced movements";
      default:
        return "";
    }
  }
}
