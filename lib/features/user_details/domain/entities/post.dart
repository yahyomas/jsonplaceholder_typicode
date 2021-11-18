import 'package:equatable/equatable.dart';

class Post extends Equatable {
  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  Post(
      {required this.id,
      required this.userId,
      required this.body,
      required this.title});

  @override
  List<Object?> get props => [id, userId, body, title];
}

class UserPosts extends Equatable {
  late final List<Post> posts;

  UserPosts({required this.posts});

  @override
  List<Object?> get props => [posts];
}
