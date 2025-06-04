import 'package:flutter/material.dart';
import '../../service/user_data_service.dart';
import 'gender_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController nameController = TextEditingController();
  String? errorMessage;

  void _goToNextScreen() {
    final name = nameController.text.trim();
    if (name.isNotEmpty) {
      UserDataService.setUserName(name); // Enregistrement dans le service
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GenderScreen()),
      );
    } else {
      setState(() {
        errorMessage = 'Please enter your name.';
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "WHAT'S YOUR NAME ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      fontFamily: "InriaSerif-bold",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hello! My name is Boujemaa and I’m your\npersonal trainer. What would you like to be called?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.4,
                      fontFamily: "InriaSerif-Regular",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Image.asset('assets/images/fitnessicon.png', width: 150),
                  const SizedBox(height: 30),
                  TextField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.red,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  if (errorMessage != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _goToNextScreen,
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
}
