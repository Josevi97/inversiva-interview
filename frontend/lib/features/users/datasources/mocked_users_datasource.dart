import 'package:frontend/datasources/remote_datasource.dart';
import 'package:frontend/features/users/datasources/users_datasource.dart';
import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/features/users/dtos/update_user_dto.dart';
import 'package:frontend/features/users/user.dart';

List<User> mockedUsers = [
  User(
    id: '1',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.basic,
  ),
  User(
    id: '2',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.admin,
  ),
  User(
    id: '3',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.basic,
  ),
  User(
    id: '4',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.basic,
  ),
  User(
    id: '5',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.basic,
  ),
  User(
    id: '6',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.basic,
  ),
  User(
    id: '7',
    name: 'John Doe',
    email: '8K6f6@example.com',
    role: UserRole.basic,
  ),
];

int count = 7;

/// Just for testing
class MockedUsersDatasource extends RemoteDatasource
    implements UsersDatasource {
  @override
  Future<List<User>> getUsers() async {
    return mockedUsers;
  }

  @override
  Future<User?> getUser(String id) async {
    final isIncluded = mockedUsers.any((user) => user.id == id);
    if (isIncluded) {
      return mockedUsers.firstWhere((user) => user.id == id);
    }

    return null;
  }

  @override
  Future<User?> createUser(CreateUserDto dto) {
    count++;

    final id = count.toString();
    final user = User(id: id, name: dto.name, email: dto.email, role: dto.role);
    mockedUsers.add(user);

    return Future.value(user);
  }

  @override
  Future<User?> updateUser(UpdateUserDto dto) {
    return Future.value(null);
  }

  @override
  Future<bool> deleteUser(String id) async {
    final isIncluded = mockedUsers.any((user) => user.id == id);
    if (isIncluded) {
      mockedUsers.removeWhere((user) => user.id == id);
    }

    return isIncluded;
  }
}
