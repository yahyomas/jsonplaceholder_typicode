import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_posts/domain/entities/comment.dart';
import 'package:demo_app_bloc/features/user_posts/domain/entities/post_comments.dart';

abstract class PostsRepository {
  Future<Either<Failure, PostCommentsList>> getPostComments(int postId);

  Future<Either<Failure, CommentResponse>> leaveAComment(
      int postId, Comment comment);
}
