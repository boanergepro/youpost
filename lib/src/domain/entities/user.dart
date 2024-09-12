class User {
  final int id;
  final String name;
  final String email;
  final String website;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
  });

  String get initialLetter => name[0];
}
