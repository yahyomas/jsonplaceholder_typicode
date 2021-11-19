import 'package:demo_app/features/user_posts/domain/entities/post_comments.dart';

class PostCommentModel extends PostComment {
  PostCommentModel(
      {required int postId,
      required int id,
      required String name,
      required String email,
      required String body})
      : super(id: id, postId: postId, body: body, email: email, name: name);

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    return PostCommentModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

class PostCommentsListModel extends PostCommentsList {
  PostCommentsListModel({required List<PostCommentModel> comments})
      : super(comments: comments);

  factory PostCommentsListModel.fromJson(Iterable json) {
    return PostCommentsListModel(
      comments: List.from(
        json.map(
          (e) => PostCommentModel.fromJson(e),
        ),
      ),
    );
  }
}
