import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/features/albums/domain/entities/photo_entity.dart';

abstract class IPhotoRepository {
  Future<Either<Failure, List<PhotoEntity>>> getAllPhotoForAlbum(int albumId);
}
