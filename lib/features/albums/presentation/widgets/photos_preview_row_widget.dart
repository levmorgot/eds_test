import 'package:flutter/material.dart';
import 'package:eds_test/features/albums/domain/entities/photo_entity.dart';
import 'package:eds_test/features/albums/presentation/widgets/photo_cache_image_widget.dart';

class PhotosPreviewRow extends StatelessWidget {
  final List<PhotoEntity> photos;

  const PhotosPreviewRow({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [..._getPhotosToPreview(photos)],
    );
  }

  List<Widget> _getPhotosToPreview(List<PhotoEntity> photos) {
    List<Widget> photoWidgets = [];

    final length = photos.length < 3 ? photos.length : 3;
    for (var i = 0; i < length; i++) {
      photoWidgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PhotoCacheImage(
            height: 70,
            width: 70,
            photoUrl: photos[i].thumbnailUrl,
          ),
        ),
      );
    }
    return photoWidgets;
  }
}
