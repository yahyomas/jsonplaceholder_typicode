import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/user_albums/domain/entities/album_details.dart';

abstract class AlbumsRepository {
  Future<Either<Failure, AlbumPhotosList>> getAlbumsPhotos(int albumId);
}
