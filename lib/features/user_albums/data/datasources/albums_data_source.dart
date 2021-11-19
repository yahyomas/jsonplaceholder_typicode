import 'dart:convert';

import 'package:demo_app/core/errors/exceptions.dart';
import 'package:demo_app/core/network/constants.dart';
import 'package:demo_app/features/user_albums/data/models/albums_photos_model.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsDataSource {
  Future<AlbumPhotosModelList> getAlbumsPhotos(int albumId);
}

class AlbumsDataSourceImpl extends AlbumsDataSource {
  final http.Client client;

  AlbumsDataSourceImpl({required this.client});

  @override
  Future<AlbumPhotosModelList> getAlbumsPhotos(int albumId) async {
    var url = Uri.parse(BASE_URL + albums + '/$albumId/' + photos);
    print(url);
    final response = await client.get(url);
    if (response.statusCode == STATUS_OK) {
      final jsonResponse = jsonDecode(response.body);
      return AlbumPhotosModelList.fromJson(jsonResponse);
    } else {
      throw ServerException(
        code: response.statusCode,
      );
    }
  }
}
