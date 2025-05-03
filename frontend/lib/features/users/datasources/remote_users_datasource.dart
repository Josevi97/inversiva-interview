import 'dart:convert';

import 'package:frontend/datasources/remote_datasource.dart';
import 'package:frontend/features/users/datasources/users_datasource.dart';
import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/features/users/dtos/update_user_dto.dart';
import 'package:frontend/features/users/user.dart';
import 'package:frontend/globals.dart';

import 'package:http/http.dart' as http;

class RemoteUsersDatasource extends RemoteDatasource
    implements UsersDatasource {
  @override
  Future<List<User>> getUsers() async {
    final uri = Uri.parse("$apiHost/users");
    final result = await http.get(uri);

    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      final data = json['data'] as List?;

      return data?.map<User>((e) => User.fromJson(e)).toList() ?? [];
    }

    return [];
  }

  @override
  Future<User?> getUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<User?> createUser(CreateUserDto dto) {
    throw UnimplementedError();
  }

  @override
  Future<User?> updateUser(UpdateUserDto dto) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteUser(String id) {
    throw UnimplementedError();
  }
}
