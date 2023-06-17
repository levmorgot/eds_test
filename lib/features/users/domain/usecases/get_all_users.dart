import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/core/usecases/usecase.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';
import 'package:eds_test/features/users/domain/repositories/user_repository.dart';

class GetAllUsers extends UseCase<List<UserEntity>, void> {
  final IUserRepository userRepository;

  GetAllUsers(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(params) async {
    return await userRepository.getAllUsers();
  }
}
