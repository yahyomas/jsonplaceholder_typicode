import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userName;
  final String name;
  final int id;

  User({required this.id, required this.name, required this.userName});

  @override
  List<Object?> get props => [id, name, userName];
}


class UsersList extends Equatable{
  final List<User> myList;
  UsersList({required this.myList});

  @override
  List<Object?> get props => [myList];

}

