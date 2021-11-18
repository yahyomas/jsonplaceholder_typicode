import 'dart:convert';
import 'package:demo_app_bloc/features/users_list/data/models/users_model.dart';
import 'package:demo_app_bloc/features/users_list/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture.dart';


void main(){
  final tUsersModel = UsersListModel(usersList: [UserModel(id: 0, name: 'name', userName: 'userName')]);
  test('should be a subclass of UsersList entities', ()async{
    //assert
    expect(tUsersModel,  isA<UsersList>());
  });

  group('from json', (){
    test('should return dart class from json', ()async{
      //arrange

      final Iterable jsonMap = json.decode(fixture('users_list.json'));
      //act
      final result = UsersListModel.fromJson(jsonMap);
      //assert
      expect(result.myList[0].userName, 'Bret');

    });
  });



}