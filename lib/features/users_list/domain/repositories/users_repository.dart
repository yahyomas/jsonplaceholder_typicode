import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/users_list/data/models/users_model.dart';
import 'package:demo_app/features/users_list/domain/entities/user.dart';

abstract class UsersRepository{
  Future<Either<Failure, UsersList>>? getAllUsers();
}