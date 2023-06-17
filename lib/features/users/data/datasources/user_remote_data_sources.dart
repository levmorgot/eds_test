import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/users/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class IUserRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
}

class UserRemoteDataSource implements IUserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  @override
  Future<List<UserModel>> getAllUsers() async {
    return await _getUsersFromUrl('https://jsonplaceholder.typicode.com/users');
  }

  Future<List<UserModel>> _getUsersFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final users = json.decode(response.body) as List<dynamic>;
      return users.map<UserModel>((dynamic user) => UserModel.fromJson(user as Map<String, dynamic>)).toList();
    } else {
      throw ServerException();
    }
  }
}
