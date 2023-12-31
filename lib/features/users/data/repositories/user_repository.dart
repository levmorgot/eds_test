import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/users/data/datasources/user_local_data_sources.dart';
import 'package:eds_test/features/users/data/datasources/user_remote_data_sources.dart';
import 'package:eds_test/features/users/data/models/user_model.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';
import 'package:eds_test/features/users/domain/repositories/user_repository.dart';

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource remoteDataSource;
  final IUserLocalDataSource localDataSource;

  UserRepository(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    final allUsers = await _getUsers(() {
      return remoteDataSource.getAllUsers();
    });
    return allUsers.fold((failure) => Left(failure), (users) => Right(users));
  }

  Future<Either<Failure, String>> _getLastEdit() async {
    try {
      final lastEdit = await localDataSource.getLastEdit();
      return Right(lastEdit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, List<UserModel>>> _getUsers(
      Future<List<UserModel>> Function() getUsers) async {
    final lastEdit = await _getLastEdit();
    return lastEdit.fold((failure) => Left(failure), (date) async {
      if (date != DateTime.now().toString().substring(0, 10)) {
        try {
          final remoteUsers = await getUsers();
          localDataSource
              .lastEditToCache(DateTime.now().toString().substring(0, 10));
          localDataSource.userToCache(remoteUsers);
          return Right(remoteUsers);
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        try {
          final localUsers = await localDataSource.getLastUsersFromCache();
          return Right(localUsers);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    });
  }
}
