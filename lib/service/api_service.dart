import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/exercise.dart';


class ApiService {
  static const String baseUrl = 'https://api.api-ninjas.com/v1/exercises';
  static const String apiKey = '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';

  static Future<List<Exercise>> getExercisesByMuscle(String muscle) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?muscle=$muscle'),
        headers: {
          'X-Api-Key': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }

  static Future<List<Exercise>> getExercisesByType(String type) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?type=$type'),
        headers: {
          'X-Api-Key': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }

  static Future<List<Exercise>> getExercisesByDifficulty(String difficulty) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?difficulty=$difficulty'),
        headers: {
          'X-Api-Key': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }

  static Future<List<Exercise>> getAllExercises({
    String? muscle,
    String? type,
    String? difficulty,
    int? limit,
  }) async {
    try {
      String url = baseUrl;
      List<String> queryParams = [];

      if (muscle != null) queryParams.add('muscle=$muscle');
      if (type != null) queryParams.add('type=$type');
      if (difficulty != null) queryParams.add('difficulty=$difficulty');
      if (limit != null) queryParams.add('limit=$limit');

      if (queryParams.isNotEmpty) {
        url += '?' + queryParams.join('&');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-Api-Key': apiKey,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Exercise.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exercises: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching exercises: $e');
    }
  }

  static Future<List<Exercise>> getFeaturedWorkout() async {
    try {
      List<String> muscleGroups = ['abdominals', 'biceps', 'chest', 'legs'];
      List<Exercise> allExercises = [];

      for (String muscle in muscleGroups) {
        List<Exercise> exercises = await getExercisesByMuscle(muscle);
        if (exercises.isNotEmpty) {
          allExercises.add(exercises.first); 
        }
      }

      return allExercises;
    } catch (e) {
      throw Exception('Error fetching featured workout: $e');
    }
  }
}