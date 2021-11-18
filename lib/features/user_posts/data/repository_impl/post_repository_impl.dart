import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/exceptions.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_posts/data/datasources/post_data_source.dart';
import 'package:demo_app_bloc/features/user_posts/data/models/comment.dart';
import 'package:demo_app_bloc/features/user_posts/domain/entities/comment.dart';
import 'package:demo_app_bloc/features/user_posts/domain/entities/post_comments.dart';
import 'package:demo_app_bloc/features/user_posts/domain/repositories/posts_repostory.dart';

class PostsRepositoryImpl extends PostsRepository {
  final PostsDataSource datasource;

  PostsRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, PostCommentsList>> getPostComments(int postId) async {
    try {
      final res = await datasource.getAlbumsPhotos(postId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          props: [
            e.code.toString(),
          ],
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CommentResponse>> leaveAComment(
      int postId, Comment comment) async {
    try {
      final commentModel = CommentModel(
          name: comment.name, email: comment.email, text: comment.text);
      final res = await datasource.leaveAComment(postId, commentModel);
      return Right(res);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          props: [
            e.code.toString(),
          ],
        ),
      );
    }
  }
}
