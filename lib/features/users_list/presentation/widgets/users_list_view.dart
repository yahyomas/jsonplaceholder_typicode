import 'package:demo_app/features/user_details/presentation/pages/user_info_page.dart';
import 'package:demo_app/features/users_list/presentation/view_model/users_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UsersListView extends ViewModelWidget<UsersPageViewModel> {
  const UsersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, UsersPageViewModel model) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final user = model.usersList.myList[index];
          return ColoredBox(
            color: Colors.white,
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserInfoPage(userId: user.id, userName: user.userName);
                }));
              },
              title: Text(user.name),
              trailing: Text(user.userName),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 12,
          );
        },
        itemCount: model.usersList.myList.length);
  }
}
