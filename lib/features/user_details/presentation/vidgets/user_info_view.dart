import 'package:demo_app/features/user_details/presentation/vidgets/user_albums_view.dart';
import 'package:demo_app/features/user_details/presentation/vidgets/user_info_item.dart';
import 'package:demo_app/features/user_details/presentation/vidgets/user_posts_view.dart';
import 'package:demo_app/features/user_details/presentation/view_model/user_info_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserInfoView extends ViewModelWidget<UserInfoPageViewModel> {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, UserInfoPageViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: [
          UserInfoItem(name: 'name', value: model.userInfo.name),
          UserInfoItem(name: 'email', value: model.userInfo.mail),
          UserInfoItem(name: 'phone', value: model.userInfo.phone),
          UserInfoItem(name: 'website', value: model.userInfo.website),
          UserInfoItem(
              name: 'working company name',
              value: model.userInfo.workingCompany.name),
          UserInfoItem(
              name: 'working company bs',
              value: model.userInfo.workingCompany.bs),
          UserInfoItem(
              name: 'catch phrase',
              value: model.userInfo.workingCompany.catchPhrase),
          UserInfoItem(name: 'city', value: model.userInfo.address.city),
          UserInfoItem(name: 'street', value: model.userInfo.address.street),
          UserInfoItem(name: 'zip code', value: model.userInfo.address.zipCode),
          SizedBox(
            height: 12,
          ),
          model.userPosts == null
              ? Center(child: CircularProgressIndicator())
              : UserPostsView(),
          SizedBox(
            height: 12,
          ),
          model.userAlbums == null
              ? Center(child: CircularProgressIndicator())
              : UserAlbumsView()
        ],
      ),
    );
  }
}
