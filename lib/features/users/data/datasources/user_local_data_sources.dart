import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/users/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserLocalDataSource {
  Future<List<UserModel>> getLastUsersFromCache();

  Future<String> getLastEdit();

  Future<void> userToCache(List<UserModel> users);

  Future<void> lastEditToCache(String lastEdit);
}

const cacheUsersList = 'CACHE_USERS_LIST';
const cacheUsersLastEdit = 'CACHE_USERS_LAST_EDIT';

class UserLocalDataSource implements IUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> userToCache(List<UserModel> users) {
    final jsonUserList =
        users.map((user) => json.encode(user.toJson())).toList();
    sharedPreferences.setStringList(cacheUsersList, jsonUserList);
    return Future.value();
  }

  @override
  Future<List<UserModel>> getLastUsersFromCache() {
    final jsonUserList = sharedPreferences.getStringList(cacheUsersList);
    if (jsonUserList != null && jsonUserList.isNotEmpty) {
      try {
        return Future.value(
          jsonUserList
              .map(
                (user) => UserModel.fromJson(
                  json.decode(user) as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
      } catch (e) {
        throw CacheException();
      }
    } else if (jsonUserList != null && jsonUserList.isEmpty) {
      return Future.value([]);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<String> getLastEdit() {
    final jsonUserLastEdit = sharedPreferences.getString(cacheUsersLastEdit);
    if (jsonUserLastEdit != null && jsonUserLastEdit.isNotEmpty) {
      try {
        return Future.value(jsonUserLastEdit);
      } catch (e) {
        throw CacheException();
      }
    } else {
      return Future.value("");
    }
  }

  @override
  Future<void> lastEditToCache(String lastEdit) {
    sharedPreferences.setString(cacheUsersLastEdit, lastEdit);
    return Future.value();
  }
}
