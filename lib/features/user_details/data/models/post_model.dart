import 'package:demo_app/features/user_details/domain/entities/post.dart';

class PostModel extends Post {
  PostModel(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : super(userId: userId, id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

class PostModelList extends UserPosts {
  PostModelList({required List<PostModel> models}) : super(posts: models);

  factory PostModelList.fromJson(Iterable json) {
    return PostModelList(
        models: List.from(json.map((e) => PostModel.fromJson(e))));
  }
}
