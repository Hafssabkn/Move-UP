import 'exercise.dart';

class ProgrammeSport {
  final String id;
  final DateTime date;
  final String level;
  final List<Exercise> exercises;
  final String userId;

  ProgrammeSport({
    required this.id,
    required this.date,
    required this.level,
    required this.exercises,
    required this.userId,
  });
}