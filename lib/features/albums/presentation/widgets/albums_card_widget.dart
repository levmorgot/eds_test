import 'package:eds_test/common/app_colors.dart';
import 'package:eds_test/features/albums/domain/entities/album_entity.dart';
import 'package:eds_test/features/albums/domain/entities/photo_entity.dart';
import 'package:eds_test/features/albums/presentation/pages/album_detail_screen.dart';
import 'package:eds_test/features/albums/presentation/widgets/photos_preview_row_widget.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final AlbumEntity album;
  final List<PhotoEntity> photos;

  const AlbumCard({Key? key, required this.album, required this.photos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photosForAlbum =
        photos.where((photo) => photo.albumId == album.id).toList();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute<AlbumDetailPage>(
                builder: (BuildContext context) =>
                    AlbumDetailPage(album: album, photos: photosForAlbum)));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                album.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              PhotosPreviewRow(photos: photosForAlbum)
            ],
          ),
        ),
      ),
    );
  }
}
