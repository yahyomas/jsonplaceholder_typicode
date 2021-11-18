import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_app_bloc/features/user_albums/domain/entities/album_details.dart';
import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem({Key? key, required this.photo}) : super(key: key);
  final AlbumPhoto photo;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
          child: CachedNetworkImage(
        progressIndicatorBuilder: (context, url, progress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        imageUrl: photo.url,
      )),
    );
  }
}
