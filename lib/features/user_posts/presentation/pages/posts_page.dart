import 'package:demo_app/features/user_details/domain/entities/post.dart';
import 'package:demo_app/features/user_posts/presentation/pages/post_commetns.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key, required this.userPosts}) : super(key: key);
  final UserPosts userPosts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final post = userPosts.posts[index];
            return ColoredBox(
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PostCommentsPage(post: post);
                  }));
                },
                title: Text(post.title),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 12,
            );
          },
          itemCount: userPosts.posts.length),
    );
  }
}
