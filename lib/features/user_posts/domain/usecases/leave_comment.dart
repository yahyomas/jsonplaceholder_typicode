import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_posts/domain/entities/comment.dart';
import 'package:demo_app_bloc/features/user_posts/domain/repositories/posts_repostory.dart';

class LeaveComment {
  final PostsRepository repository;

  LeaveComment({required this.repository});

  Future<Either<Failure, CommentResponse>> call(
      int postId, Comment comment) async {
    final res = await repository.leaveAComment(postId, comment);
    return res;
  }
}
