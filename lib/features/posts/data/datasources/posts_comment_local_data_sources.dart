import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/posts/data/models/posts_comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPostsCommentLocalDataSource {
  Future<List<PostsCommentModel>> getLastCommentsForPostsFromCache(int postId);

  Future<String> getLastEdit(int postId);

  Future<void> commentsForPostToCache(
      int postId, List<PostsCommentModel> postsComments);

  Future<void> addNewCommentForPostToCache(
      int postId, PostsCommentModel postsComment);

  Future<void> lastEditToCache(int postId, String lastEdit);
}

const cachePostsCommentsList = 'CACHE_POSTS_COMMENTS_LIST';
const cachePostsCommentsLastEdit = 'CACHE_POSTS_COMMENTS_LAST_EDIT';

class PostsCommentLocalDataSource implements IPostsCommentLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostsCommentLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> commentsForPostToCache(
      int postId, List<PostsCommentModel> postsComments) {
    final jsonPostsCommentList = postsComments
        .map((postsComment) => json.encode(postsComment.toJson()))
        .toList();
    sharedPreferences.setStringList(
        '$cachePostsCommentsList$postId', jsonPostsCommentList);
    return Future.value();
  }

  @override
  Future<List<PostsCommentModel>> getLastCommentsForPostsFromCache(int postId) {
    final jsonPostsCommentList =
        sharedPreferences.getStringList('$cachePostsCommentsList$postId');
    if (jsonPostsCommentList != null && jsonPostsCommentList.isNotEmpty) {
      try {
        return Future.value(jsonPostsCommentList
            .map((postsComment) => PostsCommentModel.fromJson(
                json.decode(postsComment) as Map<String, dynamic>))
            .toList());
      } catch (e) {
        throw CacheException();
      }
    } else if (jsonPostsCommentList != null && jsonPostsCommentList.isEmpty) {
      return Future.value([]);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<String> getLastEdit(int postId) {
    final jsonCommentsLastEdit =
        sharedPreferences.getString('$cachePostsCommentsLastEdit$postId');
    if (jsonCommentsLastEdit != null && jsonCommentsLastEdit.isNotEmpty) {
      try {
        return Future.value(jsonCommentsLastEdit);
      } catch (e) {
        throw CacheException();
      }
    } else {
      return Future.value("");
    }
  }

  @override
  Future<void> lastEditToCache(int postId, String lastEdit) {
    sharedPreferences.setString(
        '$cachePostsCommentsLastEdit$postId', lastEdit);
    return Future.value();
  }

  @override
  Future<void> addNewCommentForPostToCache(
      int postId, PostsCommentModel postsComment) async {
    final oldComments = await getLastCommentsForPostsFromCache(postId);
    oldComments.add(postsComment);
    final jsonPostsCommentList = oldComments
        .map((postsComment) => json.encode(postsComment.toJson()))
        .toList();
    await sharedPreferences.setStringList(
        '$cachePostsCommentsList$postId', jsonPostsCommentList);
    return Future.value();
  }
}
