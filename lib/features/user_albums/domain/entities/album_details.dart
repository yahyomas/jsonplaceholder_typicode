import 'package:equatable/equatable.dart';

class AlbumPhoto extends Equatable {
  late final int albumId;
  late final int id;
  late final String title;
  late final String url;
  late final String thumbnailUrl;

  AlbumPhoto(
      {required this.thumbnailUrl,
      required this.url,
      required this.title,
      required this.id,
      required this.albumId});

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}

class AlbumPhotosList extends Equatable {
  late final List<AlbumPhoto> albumPhotos;

  AlbumPhotosList({required this.albumPhotos});

  @override
  List<Object?> get props => [albumPhotos];
}
