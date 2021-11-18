import 'package:demo_app_bloc/features/user_albums/presentation/pages/album_photos_page.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserAlbumsPage extends StatelessWidget {
  const UserAlbumsPage({Key? key, required this.albums}) : super(key: key);

  final UserAlbums albums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final album = albums.albums[index];
            return ColoredBox(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AlbumPhotosPage(album: album);
                  }));
                },
                title: Text(album.title),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 12,
            );
          },
          itemCount: albums.albums.length),
    );
  }
}
