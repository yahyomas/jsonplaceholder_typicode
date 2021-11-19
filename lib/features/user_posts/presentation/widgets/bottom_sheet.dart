import 'package:demo_app/features/user_posts/presentation/viewmodel/post_comments_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomSheet extends ViewModelWidget<PostCommentsPageViewModel> {
  const BottomSheet({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  Widget build(BuildContext context, PostCommentsPageViewModel model) {
    return Padding(
      padding: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: model.nameController,
            decoration: InputDecoration(hintText: 'name'),
          ),
          TextFormField(
            controller: model.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'email',
            ),
          ),
          TextFormField(
            controller: model.textController,
            decoration: InputDecoration(hintText: 'text'),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                model.createAComment(postId);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).primaryColor),
                height: 56,
                child: Center(
                  child: Text(
                    'Leave a comment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
