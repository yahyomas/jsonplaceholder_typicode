import 'package:demo_app/core/locator/locator.dart';
import 'package:demo_app/core/widgets/loading_view.dart';
import 'package:demo_app/features/users_list/presentation/view_model/users_page_viewmodel.dart';
import 'package:demo_app/features/users_list/presentation/widgets/users_list_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersPageViewModel>.reactive(
        onModelReady: (model) => model.init(),
        viewModelBuilder: () {
          return getIt<UsersPageViewModel>();
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Users'),
            ),
            body: model.loading ? LoadingView() : UsersListView(),
          );
        });
  }
}
