import 'package:demo_app_bloc/features/user_details/presentation/view_model/user_info_page_viewmodel.dart';
import 'package:demo_app_bloc/features/user_posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserPostsView extends ViewModelWidget<UserInfoPageViewModel> {
  const UserPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, UserInfoPageViewModel model) {
    return Column(
      children: [
        ListTile(
          title: Text('Posts'),
          trailing: MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PostsPage(
                  userPosts: model.userPosts!,
                );
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
            final post = model.userPosts!.posts[index];
            return ColoredBox(
              color: Colors.white,
              child: ListTile(
                title: Text(post.title),
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
