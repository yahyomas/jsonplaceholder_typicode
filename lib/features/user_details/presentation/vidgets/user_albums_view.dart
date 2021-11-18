import 'package:demo_app_bloc/features/user_albums/presentation/pages/user_albums.dart';
import 'package:demo_app_bloc/features/user_details/presentation/view_model/user_info_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserAlbumsView extends ViewModelWidget<UserInfoPageViewModel> {
  const UserAlbumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, UserInfoPageViewModel model) {
    return Column(
      children: [
        ListTile(
          title: Text('Albums'),
          trailing: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserAlbumsPage(albums: model.userAlbums!);
              }));
            },
            child: Text('all'),
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            final album = model.userAlbums!.albums[index];
            return ColoredBox(
              color: Colors.white,
              child: ListTile(
                title: Text(album.title),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 12,
            );
          },
        )
      ],
    );
  }
}
