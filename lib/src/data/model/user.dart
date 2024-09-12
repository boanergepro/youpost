class UserModel {
  final int id;
  final String name;
  final String email;
  final String website;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'],
      name: json['name'],
      email: json['email'],
      website: json['website'],
    );
  }
}
