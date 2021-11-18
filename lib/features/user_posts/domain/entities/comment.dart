import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  late final String name;
  late final String email;
  late final String text;

  Comment({required this.email, required this.name, required this.text});

  @override
  List<Object?> get props => [email, name, text];
}

class CommentResponse extends Equatable {
  late final int id;
  late final String postId;

  CommentResponse({required this.id, required this.postId});

  @override
  List<Object?> get props => [id, postId];
}
