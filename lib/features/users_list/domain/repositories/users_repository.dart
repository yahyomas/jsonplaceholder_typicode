import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/users_list/data/models/users_model.dart';
import 'package:demo_app_bloc/features/users_list/domain/entities/user.dart';

abstract class UsersRepository{
  Future<Either<Failure, UsersList>>? getAllUsers();
}