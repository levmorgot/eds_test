import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/albums/data/models/photo_model.dart';
import 'package:http/http.dart' as http;

abstract class IPhotoRemoteDataSource {
  Future<List<PhotoModel>> getAllPhotosForAlbum(int albumId);
}

class PhotoRemoteDataSource implements IPhotoRemoteDataSource {
  final http.Client client;

  PhotoRemoteDataSource({required this.client});

  @override
  Future<List<PhotoModel>> getAllPhotosForAlbum(int albumId) async {
    return await _getPhotosFromUrl(
        'https://jsonplaceholder.typicode.com/albums/$albumId/photos');
  }

  Future<List<PhotoModel>> _getPhotosFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final photos = json.decode(response.body) as List<dynamic>;
      print('photosJson $photos');
      return photos
          .map((dynamic photo) =>
              PhotoModel.fromJson(photo as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
