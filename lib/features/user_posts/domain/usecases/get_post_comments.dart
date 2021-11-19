import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/user_posts/domain/entities/post_comments.dart';
import 'package:demo_app/features/user_posts/domain/repositories/posts_repostory.dart';

class GetPostComments {
  final PostsRepository repository;

  GetPostComments({required this.repository});

  Future<Either<Failure, PostCommentsList>> call(int postId) async {
    final res = await repository.getPostComments(postId);
    return res;
  }
}
