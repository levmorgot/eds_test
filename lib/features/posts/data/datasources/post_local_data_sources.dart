import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPostLocalDataSource {
  Future<List<PostModel>> getLastPostsForUserFromCache(int userId);

  Future<String> getLastEdit(int userId);

  Future<void> postForUserToCache(int userId, List<PostModel> posts);

  Future<void> lastEditToCache(int userId, String lastEdit);
}

const cachePostsList = 'CACHE_POSTS_LIST';
const cachePostsLastEdit = 'CACHE_POSTS_LAST_EDIT';

class PostLocalDataSource implements IPostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> postForUserToCache(int userId, List<PostModel> posts) {
    final jsonPostList =
        posts.map((post) => json.encode(post.toJson())).toList();
    sharedPreferences.setStringList('$cachePostsList$userId', jsonPostList);
    return Future.value();
  }

  @override
  Future<List<PostModel>> getLastPostsForUserFromCache(int userId) {
    final jsonPostList =
        sharedPreferences.getStringList('$cachePostsList$userId');
    if (jsonPostList != null && jsonPostList.isNotEmpty) {
      try {
        return Future.value(jsonPostList
            .map((post) =>
                PostModel.fromJson(json.decode(post) as Map<String, dynamic>))
            .toList());
      } catch (e) {
        throw CacheException();
      }
    } else if (jsonPostList != null && jsonPostList.isEmpty) {
      return Future.value([]);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<String> getLastEdit(int userId) {
    final jsonPostsLastEdit =
        sharedPreferences.getString('$cachePostsLastEdit$userId');
    if (jsonPostsLastEdit != null && jsonPostsLastEdit.isNotEmpty) {
      try {
        return Future.value(jsonPostsLastEdit);
      } catch (e) {
        throw CacheException();
      }
    } else {
      return Future.value("");
    }
  }

  @override
  Future<void> lastEditToCache(int userId, String lastEdit) {
    sharedPreferences.setString('$cachePostsLastEdit$userId', lastEdit);
    return Future.value();
  }
}
