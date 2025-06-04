import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  const WorkoutDetailScreen({super.key});

  final List<Map<String, String>> exercises = const [
    {'name': 'Jumping Jacks', 'duration': '00:30', 'icon_placeholder_text': 'JJ'},
    {'name': 'Squats', 'duration': '00:30', 'icon_placeholder_text': 'SQ'},
    {'name': 'Wall Push-up', 'duration': '00:30', 'icon_placeholder_text': 'WP'},
    {'name': 'Reverse Lunge', 'duration': '00:30', 'icon_placeholder_text': 'RL'},
    {'name': 'Elbows Back', 'duration': '00:30', 'icon_placeholder_text': 'EB'},
    {'name': '90/90 Crunch', 'duration': '00:30', 'icon_placeholder_text': 'CR'},
  ];

  Widget _buildExerciseIconPlaceholder(String text) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Custom App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {
                          // Handle menu
                        },
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    children: [
                      const Text(
                        'Full Body Shred',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'DAY 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined, color: Colors.white70, size: 20),
                          const SizedBox(width: 8),
                          const Text('9 Min.', style: TextStyle(color: Colors.white70, fontSize: 16)),
                          const SizedBox(width: 20),
                          const Icon(Icons.local_fire_department_outlined, color: Colors.white70, size: 20),
                          const SizedBox(width: 8),
                          const Text('85 Cal.', style: TextStyle(color: Colors.white70, fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Instructions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Trainer Video',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Replace with Image.asset if you have actual avatar images
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[700],
                                // child: Image.asset('assets/avatar1.png'), // if you have it
                                child: const Icon(Icons.person, color: Colors.white54),
                              ),
                              const SizedBox(width: 5),
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.blueGrey[700],
                                    // child: Image.asset('assets/avatar2.png'), // if you have it
                                    child: const Icon(Icons.person_outline, color: Colors.white70),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Colors.redAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.check, color: Colors.white, size: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.chevron_right, color: Colors.white70, size: 30),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      const Text(
                        '13 Exercises',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ...exercises.map((exercise) => Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Row(
                          children: [
                            _buildExerciseIconPlaceholder(exercise['icon_placeholder_text']!),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exercise['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  exercise['duration']!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )).toList(),
                      const SizedBox(height: 70), // Space for the start button
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              // color: Colors.black.withOpacity(0.8), // Optional: slight dark background for better readability
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {

                },
                child: const Text('START', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}