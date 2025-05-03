import 'package:frontend/features/users/user.dart';

class CreateUserDto {
  final String name;
  final String email;
  final UserRole role;

  CreateUserDto({required this.name, required this.email, required this.role});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'role': role.value};
  }
}
