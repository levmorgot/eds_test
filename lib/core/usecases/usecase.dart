import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
