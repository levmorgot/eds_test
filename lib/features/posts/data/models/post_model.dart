import 'package:eds_test/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          body: body,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] != null ? json['id'] as int : 0,
      userId: json['userId'] != null ? json['userId'] as int : 0,
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
