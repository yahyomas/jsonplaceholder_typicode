import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/album.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/post.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/user/user_info.dart';

abstract class UserInfoRepository {
  Future<Either<Failure, UserInfo>> getUserInfo(int userId);

  Future<Either<Failure, UserPosts>> getUserPosts(int userId);

  Future<Either<Failure, UserAlbums>> getUserAlbums(int userId);
}
