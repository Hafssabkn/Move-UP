import '../model/User.dart';

class UserDataService {
  static User? _currentUser;

  // Données collectées pendant l'onboarding
  static String? _userName;
  static String? _gender;
  static String? _goal;
  static int? _fitnessLevel;
  static DateTime? _birthDate;
  static double? _currentWeight;
  static double? _goalWeight;
  static double? _height;

  // Setters pour chaque étape
  static void setUserName(String name) {
    _userName = name;
  }

  static void setGender(String gender) {
    _gender = gender;
  }

  static void setGoal(String goal) {
    _goal = goal;
  }

  static void setFitnessLevel(int level) {
    _fitnessLevel = level;
  }

  static void setPersonalInfo({
    required DateTime birthDate,
    required double currentWeight,
    required double goalWeight,
    required double height,
  }) {
    _birthDate = birthDate;
    _currentWeight = currentWeight;
    _goalWeight = goalWeight;
    _height = height;
  }

  // Créer l'objet User final
  static User createUser() {
    if (_userName == null || _gender == null || _goal == null ||
        _fitnessLevel == null || _birthDate == null ||
        _currentWeight == null || _goalWeight == null || _height == null) {
      throw Exception('Données utilisateur incomplètes');
    }

    final age = DateTime.now().year - _birthDate!.year;

    // Définir les allergies et préférences basées sur l'objectif
    List<String> allergies = [];
    List<String> preferences = [];

    switch (_goal) {
      case 'lose-weight':
        preferences = ['Low carb', 'High protein', 'Low calorie'];
        break;
      case 'build-muscle':
        preferences = ['High protein', 'Complex carbs', 'Healthy fats'];
        break;
      case 'tighten-tissue':
        preferences = ['Balanced nutrition', 'Lean proteins', 'Vegetables'];
        break;
    }

    _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nom: _userName!,
      age: age,
      weight: _currentWeight!,
      height: _height!,
      object: _goal!,
      allergies: allergies,
      preferences: preferences,
    );

    return _currentUser!;
  }

  // Getter pour l'utilisateur actuel
  static User? get currentUser => _currentUser;

  // Reset des données
  static void reset() {
    _currentUser = null;
    _userName = null;
    _gender = null;
    _goal = null;
    _fitnessLevel = null;
    _birthDate = null;
    _currentWeight = null;
    _goalWeight = null;
    _height = null;
  }

  // Vérifier si toutes les données sont collectées
  static bool get isComplete =>
      _userName != null && _gender != null && _goal != null &&
          _fitnessLevel != null && _birthDate != null &&
          _currentWeight != null && _goalWeight != null && _height != null;
}