import 'package:demo_app_bloc/features/users_list/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String name, required String userName, required int id})
      :super(userName: userName, id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        name: json['name'], userName: json["username"], id: json['id']);
  }
}

class UsersListModel extends UsersList {

  UsersListModel({required List<UserModel> usersList})
      :super(myList: usersList);

  factory UsersListModel.fromJson(Iterable json){
    return UsersListModel(usersList: List.from(json.map((e) =>UserModel.fromJson(e)))
    );
  }
}
