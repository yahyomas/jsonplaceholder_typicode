import 'package:demo_app_bloc/features/user_details/domain/entities/album.dart';

class AlbumModel extends Album {
  AlbumModel({required int userId, required int id, required String title})
      : super(userId: userId, id: id, title: title);

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class AlbumModelList extends UserAlbums {
  AlbumModelList({required List<AlbumModel> models}) : super(albums: models);

  factory AlbumModelList.fromJson(Iterable json) {
    return AlbumModelList(
        models: List.from(json.map((e) => AlbumModel.fromJson(e))));
  }
}
