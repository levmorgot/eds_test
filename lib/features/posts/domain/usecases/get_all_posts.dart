import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/core/usecases/usecase.dart';
import 'package:eds_test/features/posts/domain/entities/post_entity.dart';
import 'package:eds_test/features/posts/domain/repositories/post_repository.dart';

class GetAllPostsForUser extends UseCase<List<PostEntity>, int> {
  final IPostRepository postRepository;

  GetAllPostsForUser(this.postRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(params) async {
    return await postRepository.getAllPostsForUser(params);
  }
}
