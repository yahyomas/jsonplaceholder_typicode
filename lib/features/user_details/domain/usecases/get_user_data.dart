import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/user_details/domain/entities/user/user_info.dart';
import 'package:demo_app/features/user_details/domain/repositories/user_info_repository.dart';

class GetUserData {
  UserInfoRepository repository;

  GetUserData({required this.repository});

  Future<Either<Failure, UserInfo>> call(int userId) async {
    final res = await repository.getUserInfo(userId);
    return res;
  }
}
