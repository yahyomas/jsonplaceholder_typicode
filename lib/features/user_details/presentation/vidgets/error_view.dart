import 'package:demo_app_bloc/features/user_details/presentation/view_model/user_info_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ErrorView extends ViewModelWidget<UserInfoPageViewModel> {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, UserInfoPageViewModel model) {
    return Center(
      child: Text(model.errorText!),
    );
  }
}
