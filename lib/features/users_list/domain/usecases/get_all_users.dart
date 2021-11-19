import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/users_list/domain/entities/user.dart';
import 'package:demo_app/features/users_list/domain/repositories/users_repository.dart';

class GetAllUsers {
  final UsersRepository repository;

  GetAllUsers(this.repository);

  Future<Either<Failure, UsersList>?>? call() async {
    final res = await repository.getAllUsers();
    return res;
  }
}
