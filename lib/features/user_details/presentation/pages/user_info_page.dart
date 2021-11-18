import 'package:demo_app_bloc/core/locator/locator.dart';
import 'package:demo_app_bloc/core/widgets/loading_view.dart';
import 'package:demo_app_bloc/features/user_details/presentation/vidgets/error_view.dart';
import 'package:demo_app_bloc/features/user_details/presentation/vidgets/user_info_view.dart';
import 'package:demo_app_bloc/features/user_details/presentation/view_model/user_info_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key, required this.userId, required this.userName})
      : super(key: key);
  final int userId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserInfoPageViewModel>.reactive(
      viewModelBuilder: () => getIt<UserInfoPageViewModel>(),
      onModelReady: (model) => model.init(id: userId),
      builder:
          (BuildContext context, UserInfoPageViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(userName),
          ),
          body: model.loading
              ? LoadingView()
              : model.errorText != null
                  ? ErrorView()
                  : UserInfoView(),
        );
      },
    );
  }
}
