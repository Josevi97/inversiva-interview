enum UserRole {
  basic(value: 0),
  admin(value: 1);

  final int value;

  const UserRole({required this.value});

  String get getLabel {
    final options = {
      UserRole.basic.name: "básico",
      UserRole.admin.name: "administrador",
    };

    return options[name] ?? "-";
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final UserRole role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'role': role};
  }
}
