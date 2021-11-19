import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/user_details/domain/entities/album.dart';
import 'package:demo_app/features/user_details/domain/repositories/user_info_repository.dart';

class GetUserAlbums {
  final UserInfoRepository repository;

  GetUserAlbums({required this.repository});

  Future<Either<Failure, UserAlbums>> call(int userId) async {
    final res = await repository.getUserAlbums(userId);
    return res;
  }
}
