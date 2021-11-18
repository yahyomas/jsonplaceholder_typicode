import 'package:dartz/dartz.dart';
import 'package:demo_app_bloc/core/errors/failures.dart';
import 'package:demo_app_bloc/features/users_list/domain/entities/user.dart';
import 'package:demo_app_bloc/features/users_list/domain/repositories/users_repository.dart';

class GetAllUsers {
  final UsersRepository repository;

  GetAllUsers(this.repository);

  Future<Either<Failure, UsersList>?>? call() async {
    final res = await repository.getAllUsers();
    return res;
  }
}
