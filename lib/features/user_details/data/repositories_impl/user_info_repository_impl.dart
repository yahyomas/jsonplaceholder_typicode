import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/exceptions.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_details/data/datasources/user_info_datasourcce.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/album.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/post.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/user/user_info.dart';
import 'package:demo_app_bloc/features/user_details/domain/repositories/user_info_repository.dart';

class UserInfoRepositoryImplementation extends UserInfoRepository {
  UserInfoDataSource userInfoDataSource;

  UserInfoRepositoryImplementation({required this.userInfoDataSource});

  @override
  Future<Either<Failure, UserInfo>> getUserInfo(int userId) async {
    try {
      final res = await userInfoDataSource.getUserInfo(userId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(props: [e.code.toString()]));
    }
  }

  @override
  Future<Either<Failure, UserPosts>> getUserPosts(int userId) async {
    try {
      final res = await userInfoDataSource.getUserPosts(userId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(props: [e.code.toString()]));
    }
  }

  @override
  Future<Either<Failure, UserAlbums>> getUserAlbums(int userId) async {
    try {
      final res = await userInfoDataSource.getUserAlbums(userId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(props: [e.code.toString()]));
    }
  }
}
