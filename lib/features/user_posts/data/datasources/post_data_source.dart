import 'dart:convert';

import 'package:demo_app_bloc/core/errors/exceptions.dart';
import 'package:demo_app_bloc/core/network/constants.dart';
import 'package:demo_app_bloc/features/user_posts/data/models/comment.dart';
import 'package:demo_app_bloc/features/user_posts/data/models/post_comments_model.dart';
import 'package:http/http.dart' as http;

abstract class PostsDataSource {
  Future<PostCommentsListModel> getAlbumsPhotos(int postId);

  Future<CommentResponseModel> leaveAComment(int postId, CommentModel comment);
}

class PostsDataSourceImpl extends PostsDataSource {
  final http.Client client;

  PostsDataSourceImpl({required this.client});

  @override
  Future<PostCommentsListModel> getAlbumsPhotos(int postId) async {
    var url = Uri.parse(BASE_URL + posts + '/$postId/' + comments);
    print(url);
    final response = await client.get(url);
    if (response.statusCode == STATUS_OK) {
      final jsonResponse = jsonDecode(response.body);
      return PostCommentsListModel.fromJson(jsonResponse);
    } else {
      throw ServerException(
        code: response.statusCode,
      );
    }
  }

  @override
  Future<CommentResponseModel> leaveAComment(
      int postId, CommentModel comment) async {
    var url = Uri.parse(BASE_URL + posts + '/$postId/' + comments);
    print(url);
    print(jsonEncode(comment.toJson()));
    final response = await client.post(url, body: jsonEncode(comment.toJson()));
    print(response.statusCode);
    if (response.statusCode == SUCCESSFULLY_CREATED) {
      final jsonResponse = jsonDecode(response.body);
      return CommentResponseModel.fromJson(jsonResponse);
    } else {
      throw ServerException(
        code: response.statusCode,
      );
    }
  }
}
