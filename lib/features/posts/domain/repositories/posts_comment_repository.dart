import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/posts/domain/entities/posts_comment_entity.dart';

abstract class IPostsCommentRepository {
  Future<Either<Failure, List<PostsCommentEntity>>> getAllCommentsForPost(
      int postId);

  Future<Either<Failure, PostsCommentEntity>> sendCommentForPost(
      int postId, String name, String email, String text);
}
