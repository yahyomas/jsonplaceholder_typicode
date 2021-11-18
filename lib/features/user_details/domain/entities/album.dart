import 'package:equatable/equatable.dart';

class Album extends Equatable {
  late final int userId;
  late final int id;
  late final String title;

  Album({required this.id, required this.userId, required this.title});

  @override
  List<Object?> get props => [id, userId, title];
}

class UserAlbums extends Equatable {
  late final List<Album> albums;

  UserAlbums({required this.albums});

  @override
  List<Object?> get props => [albums];
}
