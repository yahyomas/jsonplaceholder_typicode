import 'dart:convert';

import 'package:demo_app_bloc/core/errors/exceptions.dart';
import 'package:demo_app_bloc/core/network/constants.dart';
import 'package:demo_app_bloc/features/user_details/data/models/album_model.dart';
import 'package:demo_app_bloc/features/user_details/data/models/post_model.dart';
import 'package:demo_app_bloc/features/user_details/data/models/user_info_model.dart';
import 'package:http/http.dart' as http;

abstract class UserInfoDataSource {
  ///cals https://jsonplaceholder.typicode.com/users/{user_id} to get user info
  Future<UserInfoModel> getUserInfo(int userId);

  ///cals https://jsonplaceholder.typicode.com/users/{user_id}/posts to get user posts
  Future<PostModelList> getUserPosts(int userId);

  ///cals https://jsonplaceholder.typicode.com/users/{user_id}/posts to get user posts
  Future<AlbumModelList> getUserAlbums(int userId);
}

class UserInfoDataSourceImpl extends UserInfoDataSource {
  final http.Client client;

  UserInfoDataSourceImpl({required this.client});

  @override
  Future<UserInfoModel> getUserInfo(int userId) async {
    var url = Uri.parse(BASE_URL + users + '/$userId');
    print(url);
    final response = await client.get(url);
    if (response.statusCode == STATUS_OK) {
      final jsonResponse = jsonDecode(response.body);
      return UserInfoModel.fromJson(jsonResponse);
    } else {
      throw ServerException(
        code: response.statusCode,
      );
    }
  }

  @override
  Future<PostModelList> getUserPosts(int userId) async {
    var url = Uri.parse(BASE_URL + users + '/$userId/' + posts);
    print(url);
    final response = await client.get(url);
    if (response.statusCode == STATUS_OK) {
      final jsonResponse = jsonDecode(response.body);
      return PostModelList.fromJson(jsonResponse);
    } else {
      throw ServerException(
        code: response.statusCode,
      );
    }
  }

  @override
  Future<AlbumModelList> getUserAlbums(int userId) async {
    var url = Uri.parse(BASE_URL + users + '/$userId/' + albums);
    print(url);
    final response = await client.get(url);
    if (response.statusCode == STATUS_OK) {
      final jsonResponse = jsonDecode(response.body);
      return AlbumModelList.fromJson(jsonResponse);
    } else {
      throw ServerException(
        code: response.statusCode,
      );
    }
  }
}
