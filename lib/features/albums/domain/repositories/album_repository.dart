import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/albums/domain/entities/album_entity.dart';

abstract class IAlbumRepository {
  Future<Either<Failure, List<AlbumEntity>>> getAllAlbumsForUser(int userId);
}
