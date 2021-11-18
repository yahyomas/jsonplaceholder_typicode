import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/exceptions.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/user_albums/data/datasources/albums_data_source.dart';
import 'package:demo_app_bloc/features/user_albums/domain/entities/album_details.dart';
import 'package:demo_app_bloc/features/user_albums/domain/repositories/albums_repository.dart';

class AlbumsRepositoryImplementation extends AlbumsRepository {
  final AlbumsDataSource albumsDataSource;

  AlbumsRepositoryImplementation({required this.albumsDataSource});

  @override
  Future<Either<Failure, AlbumPhotosList>> getAlbumsPhotos(int albumId) async {
    try {
      final res = await albumsDataSource.getAlbumsPhotos(albumId);
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
