
//class user
class User {
  final String id;
  final String nom;
  final int age;
  final double weight;
  final double height;
  final String object;
  final List<String> allergies;
  final List<String> preferences;

  User({
    required this.id,
    required this.nom,
    required this.age,
    required this.weight,
    required this.height,
    required this.object,
    required this.allergies,
    required this.preferences,
  });
}
