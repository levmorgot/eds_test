import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/posts/domain/entities/post_entity.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPostsForUser(int userId);
}
