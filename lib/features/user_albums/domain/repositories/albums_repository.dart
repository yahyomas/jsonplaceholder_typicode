import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_albums/domain/entities/album_details.dart';

abstract class AlbumsRepository {
  Future<Either<Failure, AlbumPhotosList>> getAlbumsPhotos(int albumId);
}
