import 'package:dartz/dartz.dart';
import 'package:eds_test/core/error/failure.dart';
import 'package:eds_test/core/usecases/usecase.dart';
import 'package:eds_test/features/albums/domain/entities/photo_entity.dart';
import 'package:eds_test/features/albums/domain/repositories/photo_repository.dart';

class GetAllPhotosForAlbum extends UseCase<List<PhotoEntity>, int> {
  final IPhotoRepository photoRepository;

  GetAllPhotosForAlbum(this.photoRepository);

  @override
  Future<Either<Failure, List<PhotoEntity>>> call(params) async {
    return await photoRepository.getAllPhotoForAlbum(params);
  }
}
