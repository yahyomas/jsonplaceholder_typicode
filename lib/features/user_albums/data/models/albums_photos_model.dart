import 'package:demo_app/features/user_albums/domain/entities/album_details.dart';

class AlbumPhotosModel extends AlbumPhoto {
  AlbumPhotosModel(
      {required int albumId,
      required int id,
      required String title,
      required String url,
      required String thumbnailUrl})
      : super(
            albumId: albumId,
            id: id,
            title: title,
            url: url,
            thumbnailUrl: thumbnailUrl);

  factory AlbumPhotosModel.fromJson(Map<String, dynamic> json) {
    return AlbumPhotosModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class AlbumPhotosModelList extends AlbumPhotosList {
  AlbumPhotosModelList({required List<AlbumPhotosModel> list})
      : super(albumPhotos: list);

  factory AlbumPhotosModelList.fromJson(Iterable json) {
    return AlbumPhotosModelList(
        list: List.from(json.map((e) => AlbumPhotosModel.fromJson(e))));
  }
}
