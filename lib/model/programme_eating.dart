import 'meal.dart';

class ProgrammeEating {
  final String id;
  final DateTime date;
  final int caloriesTotal;
  final List<Meal> meal;
  final String userId;

  ProgrammeEating({
    required this.id,
    required this.date,
    required this.caloriesTotal,
    required this.meal,
    required this.userId,
  });
}