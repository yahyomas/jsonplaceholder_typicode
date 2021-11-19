import 'package:dartz/dartz.dart';
import 'package:demo_app/core/errors/exceptions.dart';
import 'package:demo_app/core/errors/failures.dart';
import 'package:demo_app/features/users_list/data/datasources/users_data_source.dart';
import 'package:demo_app/features/users_list/domain/entities/user.dart';
import 'package:demo_app/features/users_list/domain/repositories/users_repository.dart';

class UsersRepositoryImplementation implements UsersRepository{
  final UsersDataSource usersDataSource;
  UsersRepositoryImplementation({required this.usersDataSource});

  @override
  Future<Either<Failure, UsersList>>? getAllUsers()async {
    try {
      final res = await usersDataSource.getAllUsers();
      return Right(res!);
    } on ServerException catch(e){
      return Left(ServerFailure(props: [e.code.toString()]));
    }
  }
}