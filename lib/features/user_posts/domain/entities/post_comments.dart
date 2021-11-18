import 'package:equatable/equatable.dart';

class PostComment extends Equatable {
  late final int postId;
  late final int id;
  late final String name;
  late final String email;
  late final String body;

  PostComment(
      {required this.id,
      required this.body,
      required this.name,
      required this.email,
      required this.postId});

  @override
  List<Object?> get props => [id, body, name, email, postId];
}

class PostCommentsList extends Equatable {
  late final List<PostComment> comments;

  PostCommentsList({required this.comments});

  @override
  List<Object?> get props => [comments];
}
