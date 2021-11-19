import 'dart:convert';

import 'package:demo_app/core/errors/exceptions.dart';
import 'package:demo_app/core/network/constants.dart';
import 'package:demo_app/features/users_list/data/models/users_model.dart';
import 'package:http/http.dart'as http;

abstract class UsersDataSource{
  ///Calls https://jsonplaceholder.typicode.com/users for getting all users data
  Future<UsersListModel>? getAllUsers();
}

class UsersDataSourceImpl implements UsersDataSource{
  final http.Client client;
  UsersDataSourceImpl({required this.client});


  @override
  Future<UsersListModel>? getAllUsers()async {
      var url = Uri.parse(BASE_URL+ users);
      final response = await client.get(url);
      if(response.statusCode == STATUS_OK){
        final jsonResponse = jsonDecode(response.body);
        return UsersListModel.fromJson(jsonResponse);
      }
      else{
        throw ServerException(code: response.statusCode,);
      }
  }

}