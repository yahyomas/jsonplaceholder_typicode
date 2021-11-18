import 'package:demo_app_bloc/features/user_posts/presentation/viewmodel/post_comments_page_viewmodel.dart';
import 'package:demo_app_bloc/features/user_posts/presentation/widgets/bottom_sheet.dart'
    as bsh;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddCommentBtn extends ViewModelWidget<PostCommentsPageViewModel> {
  const AddCommentBtn({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  Widget build(BuildContext context, PostCommentsPageViewModel model) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return bsh.BottomSheet(postId: postId);
              });
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
    );
  }
}
