import 'package:demo_app_bloc/core/locator/locator.dart';
import 'package:demo_app_bloc/features/user_posts/domain/entities/comment.dart'
    as lc;
import 'package:demo_app_bloc/features/user_posts/domain/entities/post_comments.dart';
import 'package:demo_app_bloc/features/user_posts/domain/usecases/get_post_comments.dart';
import 'package:demo_app_bloc/features/user_posts/domain/usecases/leave_comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostCommentsPageViewModel extends BaseViewModel {
  final GetPostComments getPostComments;
  final LeaveComment leaveComment;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController textController = TextEditingController();

  PostCommentsPageViewModel(
      {required this.getPostComments, required this.leaveComment});

  late SnackbarService snackbarService;

  PostCommentsList? postCommentsList;

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void init(int postId) {
    snackbarService = getIt<SnackbarService>();
    getData(postId);
  }

  Future<void> getData(int postId) async {
    final res = await getPostComments(postId);
    res.fold((error) {
      snackbarService.showSnackbar(message: error.props[0]);
    }, (comments) {
      postCommentsList = comments;
      notifyListeners();
    });
  }

  void createAComment(int postId) async {
    setLoading(true);
    final res = await leaveComment(
        postId,
        lc.Comment(
            email: emailController.text,
            name: nameController.text,
            text: textController.text));
    setLoading(false);
    res.fold((error) {
      snackbarService.showSnackbar(message: error.props[0]);
    }, (success) {
      snackbarService.showSnackbar(message: "Successfully added!");
    });
  }
}
