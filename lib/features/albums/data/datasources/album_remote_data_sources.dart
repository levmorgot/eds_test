import 'dart:convert';

import 'package:eds_test/core/error/exception.dart';
import 'package:eds_test/features/albums/data/models/album_model.dart';
import 'package:http/http.dart' as http;

abstract class IAlbumRemoteDataSource {
  Future<List<AlbumModel>> getAllAlbumsForUser(int userId);
}

class AlbumRemoteDataSource implements IAlbumRemoteDataSource {
  final http.Client client;

  AlbumRemoteDataSource({required this.client});

  @override
  Future<List<AlbumModel>> getAllAlbumsForUser(int userId) async {
    return await _getAlbumsFromUrl(
        'https://jsonplaceholder.typicode.com/users/$userId/albums');
  }

  Future<List<AlbumModel>> _getAlbumsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final albums = json.decode(response.body) as List<dynamic>;
      print('albumsJson $albums');
      return albums
          .map((dynamic album) =>
              AlbumModel.fromJson(album as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
