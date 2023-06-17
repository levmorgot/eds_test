import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/core/usecases/usecase.dart';
import 'package:eds_test/features/posts/domain/entities/posts_comment_entity.dart';
import 'package:eds_test/features/posts/domain/repositories/posts_comment_repository.dart';

class GetAllCommentsForPosts extends UseCase<List<PostsCommentEntity>, int> {
  final IPostsCommentRepository postsCommentRepository;

  GetAllCommentsForPosts(this.postsCommentRepository);

  @override
  Future<Either<Failure, List<PostsCommentEntity>>> call(params) async {
    return await postsCommentRepository.getAllCommentsForPost(params);
  }
}
