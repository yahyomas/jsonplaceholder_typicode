import 'package:dartz/dartz.dart';
import 'package:demo_app'
    '/features/users_list/data/models/users_model.dart';
import 'package:demo_app'
    '/features/users_list/domain/repositories/users_repository.dart';
import 'package:demo_app'
    '/features/users_list/domain/usecases/get_all_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  late GetAllUsers useCase;
  late MockUsersRepository mockUsersRepository;

  setUp(() {
    mockUsersRepository = MockUsersRepository();
    useCase = GetAllUsers(mockUsersRepository);
  });
  final list = UsersListModel(
    usersList: [
      UserModel(id: 0, name: 'name0', userName: 'username0'),
      UserModel(id: 1, name: 'name1', userName: 'username1'),
      UserModel(id: 2, name: 'name2', userName: 'username2'),
    ],
  );

  test('should get all users from repo', () async {
    //arrange
    when(mockUsersRepository.getAllUsers()).thenAnswer((_) async {
      return Right(
        UsersListModel(
          usersList: [
            UserModel(id: 0, name: 'name0', userName: 'username0'),
            UserModel(id: 1, name: 'name1', userName: 'username1'),
            UserModel(id: 2, name: 'name2', userName: 'username2'),
          ],
        ),
      );
    });

    //act
    final result = await useCase();

    //assert
    expect(result, Right(list));
  });
}
