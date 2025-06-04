import 'package:flutter/material.dart';

import 'loading_screen.dart';

class MoreInformationScreen extends StatefulWidget {
  const MoreInformationScreen({super.key});

  @override
  State<MoreInformationScreen> createState() => _MoreInformationScreenState();
}

class _MoreInformationScreenState extends State<MoreInformationScreen> {
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _goalWeightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _birthDateController.text = '1990-01-01';
    _weightController.text = '65.0';
    _goalWeightController.text = '60.0';
    _heightController.text = '165.0';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1, 1),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFE53E3E),
              onPrimary: Colors.white,
              surface: Color(0xFF2d2d2d),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _birthDateController.text =
        '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  Widget _buildInputField({
    required TextEditingController controller,
    String? suffixText,
    VoidCallback? onTap,
    bool readOnly = false,
    TextStyle? style,
    InputDecoration? decoration,
  }) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: style ?? const TextStyle(color: Colors.white),
        decoration: decoration ??
            InputDecoration(
              suffixText: suffixText,
              suffixStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white.withOpacity(0.1),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: InputBorder.none,
            ),
      ),
    );
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
                    "TELL US MORE ABOUT YOURSELF.",
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
                    "Give your trainer some additional information\nso they can provideyou with more targeted\nsupport.",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date of birth',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 145),
                      _buildInputField(
                        controller: _birthDateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixText: null,
                          suffixStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Current weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 155),
                      _buildInputField(
                        controller: _weightController,
                        suffixText: 'kg',
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixText: 'kg',
                          suffixStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Goal weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 180),
                      _buildInputField(
                        controller: _goalWeightController,
                        suffixText: 'kg',
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixText: 'kg',
                          suffixStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Height',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 210),
                      _buildInputField(
                        controller: _heightController,
                        suffixText: 'cm',
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixText: 'cm',
                          suffixStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanLoadingScreen()
                          ),
                        );
                      },
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
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _birthDateController.dispose();
    _weightController.dispose();
    _goalWeightController.dispose();
    _heightController.dispose();
    super.dispose();
  }
}
