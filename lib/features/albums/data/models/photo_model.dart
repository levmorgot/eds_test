import 'package:eds_test/features/albums/domain/entities/photo_entity.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required int id,
    required int albumId,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) : super(
          id: id,
          albumId: albumId,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] != null ? json['id'] as int : 0,
      albumId: json['albumId'] != null ? json['albumId'] as int : 0,
      title: json['title']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      thumbnailUrl: json['thumbnailUrl']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'albumId': albumId,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }
}
