// File: lib/service/llm_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/meal.dart';
import '../model/programme_eating.dart';
import '../model/User.dart';

class LLMService {
  static const String _baseUrl = 'https://api.huggingface.co/models/mistralai/Mixtral-8x7B-Instruct-v0.1';
  static const String _apiKey = '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';

  static Future<ProgrammeEating> generateMealPlan(User user) async {
    try {
      final prompt = _buildPrompt(user);

      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'inputs': prompt,
          'parameters': {
            'max_new_tokens': 1000,
            'temperature': 0.7,
            'return_full_text': false,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final generatedText = data[0]['generated_text'] ?? '';
        return _parseMealPlan(generatedText, user.id);
      } else {
        throw Exception('Erreur API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la génération du programme: $e');
      // Retourner un programme par défaut en cas d'erreur
      return _getDefaultMealPlan(user.id);
    }
  }

  static String _buildPrompt(User user) {
    final age = DateTime.now().year - user.age;
    final bmi = user.weight / ((user.height / 100) * (user.height / 100));

    return '''
Créez un programme alimentaire personnalisé pour une journée en format JSON avec les informations suivantes:

Profil utilisateur:
- Nom: ${user.nom}
- Âge: $age ans
- Poids: ${user.weight} kg
- Taille: ${user.height} cm
- IMC: ${bmi.toStringAsFixed(1)}
- Objectif: ${user.object}
- Allergies: ${user.allergies.join(', ')}
- Préférences: ${user.preferences.join(', ')}

Répondez uniquement avec un JSON au format suivant:
{
  "total_calories": 1500,
  "meals": [
    {
      "type": "Breakfast",
      "name": "Nom du repas",
      "calories": 400,
      "description": "Description détaillée"
    },
    {
      "type": "Lunch", 
      "name": "Nom du repas",
      "calories": 500,
      "description": "Description détaillée"
    },
    {
      "type": "Snack",
      "name": "Nom du repas", 
      "calories": 200,
      "description": "Description détaillée"
    },
    {
      "type": "Dinner",
      "name": "Nom du repas",
      "calories": 400,
      "description": "Description détaillée"
    }
  ]
}

Tenez compte des allergies et préférences. Adaptez les calories selon l'objectif.
''';
  }

  static ProgrammeEating _parseMealPlan(String jsonResponse, String userId) {
    try {
      // Nettoyer la réponse pour extraire le JSON
      String cleanJson = jsonResponse.trim();
      if (cleanJson.startsWith('```json')) {
        cleanJson = cleanJson.substring(7);
      }
      if (cleanJson.endsWith('```')) {
        cleanJson = cleanJson.substring(0, cleanJson.length - 3);
      }

      final data = jsonDecode(cleanJson);
      final totalCalories = data['total_calories'] ?? 1500;
      final mealsData = data['meals'] ?? [];

      List<Meal> meals = mealsData.map<Meal>((mealData) {
        return Meal(
          nom: mealData['name'] ?? 'Repas',
          type: mealData['type'] ?? 'Meal',
          calories: mealData['calories'] ?? 300,
        );
      }).toList();

      return ProgrammeEating(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        date: DateTime.now(),
        caloriesTotal: totalCalories,
        meal: meals,
        userId: userId,
      );
    } catch (e) {
      print('Erreur lors du parsing: $e');
      return _getDefaultMealPlan(userId);
    }
  }

  static ProgrammeEating _getDefaultMealPlan(String userId) {
    return ProgrammeEating(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: DateTime.now(),
      caloriesTotal: 1414,
      meal: [
        Meal(nom: "Kale, Peppers, Tomatoes, and Cashew Scramble", type: "Breakfast", calories: 328),
        Meal(nom: "Fruit Salad", type: "Breakfast", calories: 133),
        Meal(nom: "Tuna and Avocado Salad", type: "Lunch", calories: 413),
        Meal(nom: "Lemon Berry Smoothie", type: "Lunch", calories: 90),
      ],
      userId: userId,
    );
  }
}