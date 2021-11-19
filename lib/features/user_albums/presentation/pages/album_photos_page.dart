import 'package:demo_app/core/locator/locator.dart';
import 'package:demo_app/core/widgets/loading_view.dart';
import 'package:demo_app/features/user_albums/presentation/viewmodel/album_photos_page_view_model.dart';
import 'package:demo_app/features/user_albums/presentation/widgets/album_item.dart';
import 'package:demo_app/features/user_details/domain/entities/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class AlbumPhotosPage extends StatelessWidget {
  const AlbumPhotosPage({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumPhotosPageViewModel>.reactive(
        onModelReady: (model) => model.init(album.id),
        viewModelBuilder: () => getIt<AlbumPhotosPageViewModel>(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(album.title),
            ),
            body: model.albumPhotos == null
                ? LoadingView()
                : GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                        model.albumPhotos!.albumPhotos.length, (index) {
                      return AlbumItem(
                          photo: model.albumPhotos!.albumPhotos[index]);
                    }),
                  ),
          );
        });
  }
}
