import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/core/usecases/usecase.dart';
import 'package:eds_test/features/posts/domain/entities/posts_comment_entity.dart';
import 'package:eds_test/features/posts/domain/repositories/posts_comment_repository.dart';
import 'package:eds_test/features/posts/domain/usecases/params/posts_comment_params.dart';

class SendCommentsForPost
    extends UseCase<PostsCommentEntity, PostsCommentParams> {
  final IPostsCommentRepository postsCommentRepository;

  SendCommentsForPost(this.postsCommentRepository);

  @override
  Future<Either<Failure, PostsCommentEntity>> call(
      PostsCommentParams params) async {
    return await postsCommentRepository.sendCommentForPost(
        params.postId, params.name, params.email, params.text);
  }
}
