import 'package:eds_test/features/posts/domain/entities/posts_comment_entity.dart';

class PostsCommentModel extends PostsCommentEntity {
  const PostsCommentModel({
    required int id,
    required int postId,
    required String name,
    required String email,
    required String body,
  }) : super(
          id: id,
          postId: postId,
          name: name,
          email: email,
          body: body,
        );

  factory PostsCommentModel.fromJson(Map<String, dynamic> json) {
    return PostsCommentModel(
      id: json['id'] != null ? json['id'] as int : 0,
      postId: json['postId'] != null ? int.parse(json['postId'].toString()) : 0,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'postId': postId,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}
