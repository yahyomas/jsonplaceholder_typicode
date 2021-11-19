import 'package:demo_app/features/user_posts/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel(
      {required String name, required String email, required String text})
      : super(name: name, email: email, text: text);

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'text': text};
  }
}

class CommentResponseModel extends CommentResponse {
  CommentResponseModel({required int id, required String postId})
      : super(id: id, postId: postId);

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) {
    return CommentResponseModel(id: json['id'], postId: json['postId']);
  }
}
