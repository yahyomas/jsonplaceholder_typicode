import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_albums/domain/entities/album_details.dart';
import 'package:demo_app_bloc/features/user_albums/domain/repositories/albums_repository.dart';

class GetAlbumPhotos {
  final AlbumsRepository repository;

  GetAlbumPhotos({required this.repository});

  Future<Either<Failure, AlbumPhotosList>> call(int albumId) async {
    final res = await repository.getAlbumsPhotos(albumId);
    return res;
  }
}
