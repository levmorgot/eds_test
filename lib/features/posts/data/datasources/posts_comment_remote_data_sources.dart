import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/posts/data/models/posts_comment_model.dart';
import 'package:http/http.dart' as http;

abstract class IPostsCommentRemoteDataSource {
  Future<List<PostsCommentModel>> getAllCommentsForPosts(int postId);

  Future<PostsCommentModel> sendCommentForPost(
      int postId, String name, String email, String text);
}

class PostsCommentRemoteDataSource implements IPostsCommentRemoteDataSource {
  final http.Client client;

  PostsCommentRemoteDataSource({required this.client});

  @override
  Future<List<PostsCommentModel>> getAllCommentsForPosts(int postId) async {
    return await _getCommentsFromUrl(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments');
  }

  Future<List<PostsCommentModel>> _getCommentsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final comments = json.decode(response.body) as List<dynamic>;
      return comments
          .map((dynamic comment) =>
              PostsCommentModel.fromJson(comment as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostsCommentModel> sendCommentForPost(
      int postId, String name, String email, String text) async {
    final url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    final response = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"name": name, "email": email, "body": text}));
    if (response.statusCode == 201) {
      final comment = json.decode(response.body) as Map<String, dynamic>;
      return PostsCommentModel.fromJson(comment);
    } else {
      throw ServerException();
    }
  }
}
