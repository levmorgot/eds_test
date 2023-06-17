import 'package:eds_test/features/albums/domain/entities/album_entity.dart';

class AlbumModel extends AlbumEntity {
  const AlbumModel({
    required int id,
    required int userId,
    required String title,
  }) : super(
          id: id,
          userId: userId,
          title: title,
        );

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'] != null ? json['id'] as int : 0,
      userId: json['userId'] != null ? json['userId'] as int : 0,
      title: json['title']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
    };
  }
}
