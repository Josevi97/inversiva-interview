import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/features/users/dtos/update_user_dto.dart';
import 'package:frontend/features/users/user.dart';

abstract class UsersDatasource {
  Future<List<User>> getUsers();

  Future<User?> createUser(CreateUserDto dto);

  Future<User?> updateUser(UpdateUserDto dto);

  Future<bool> deleteUser(String id);
}
