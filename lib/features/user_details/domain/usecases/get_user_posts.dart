import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/user_details/domain/entities/post.dart';
import 'package:demo_app/features/user_details/domain/repositories/user_info_repository.dart';

class GetUserPosts {
  final UserInfoRepository repository;

  GetUserPosts({required this.repository});

  Future<Either<Failure, UserPosts>> call(int userId) async {
    final res = await repository.getUserPosts(userId);
    return res;
  }
}
