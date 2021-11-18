import 'package:demo_app_bloc/core/locator/locator.dart';
import 'package:demo_app_bloc/core/widgets/loading_view.dart';
import 'package:demo_app_bloc/features/user_details/domain/entities/post.dart';
import 'package:demo_app_bloc/features/user_posts/presentation/viewmodel/post_comments_page_viewmodel.dart';
import 'package:demo_app_bloc/features/user_posts/presentation/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

class PostCommentsPage extends StatelessWidget {
  const PostCommentsPage({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostCommentsPageViewModel>.reactive(
        onModelReady: (model) => model.init(post.id),
        viewModelBuilder: () => getIt<PostCommentsPageViewModel>(),
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.loading,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Comments'),
              ),
              body: Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(post.title),
                    ),
                    Expanded(
                      child: model.postCommentsList == null
                          ? LoadingView()
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                final comment =
                                    model.postCommentsList!.comments[index];
                                return ListTile(
                                  title: Text(comment.body),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                    // height: 1,
                                    );
                              },
                              itemCount:
                                  model.postCommentsList!.comments.length),
                    ),
                  ],
                ),
              ),
              bottomSheet: AddCommentBtn(
                postId: post.id,
              ),
            ),
          );
        });
  }
}
