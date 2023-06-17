import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
}
