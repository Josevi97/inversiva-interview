import 'package:frontend/features/users/datasources/remote_users_datasource.dart';
import 'package:frontend/features/users/datasources/users_datasource.dart';
import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/features/users/user.dart';

// TODO: Use cached flutter query for reactive data
class UsersRepository {
  late final UsersDatasource _datasource;

  UsersRepository({UsersDatasource? datasource})
    : _datasource = datasource ?? RemoteUsersDatasource();

  Future<List<User>> getUsers() async {
    return _datasource.getUsers();
  }

  Future<User?> createUser(CreateUserDto userDto) async {
    return _datasource.createUser(userDto);
  }

  Future<bool> deleteUser(String id) async {
    return _datasource.deleteUser(id);
  }
}
