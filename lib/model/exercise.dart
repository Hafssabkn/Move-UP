class Exercise {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  Exercise({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      type: json['type'],
      muscle: json['muscle'],
      equipment: json['equipment'],
      difficulty: json['difficulty'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'muscle': muscle,
      'equipment': equipment,
      'difficulty': difficulty,
      'instructions': instructions,
    };
  }

  String get duration {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return '5-10 Min.';
      case 'intermediate':
        return '10-20 Min.';
      case 'expert':
        return '20-30 Min.';
      default:
        return '10-15 Min.';
    }
  }

  String get level {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return '1 Level';
      case 'intermediate':
        return '2 Level';
      case 'expert':
        return '3 Level';
      default:
        return '2 Level';
    }
  }
}