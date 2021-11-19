import 'package:dartz/dartz.dart';
import 'package:demo_app/features/users_list/data/datasources/users_data_source.dart';
import 'package:demo_app/features/users_list/data/models/users_model.dart';
import 'package:demo_app/features/users_list/data/repositories_impl/users_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUsersDataSource extends Mock implements UsersDataSource {}

void main() {
  late UsersRepositoryImplementation usersRepositoryImplementation;
  late MockUsersDataSource mockUsersDataSource;

  setUp(() {
    mockUsersDataSource = MockUsersDataSource();
    usersRepositoryImplementation = UsersRepositoryImplementation(
      usersDataSource: mockUsersDataSource,
    );
  });

  group('get users data from datasource', ()  {
    final UsersListModel usersListModel = UsersListModel(usersList: [
      UserModel(name: 'name1', userName: 'userName1', id: 1),
      UserModel(name: 'name2', userName: 'userName2', id: 2),
      UserModel(name: 'name3', userName: 'userName3', id: 3),
    ]);
    test(
        'should get remote data when usersRepositoryImplementation.getAllUsers() is called successfully',
        () async {
      when(mockUsersDataSource.getAllUsers())
          .thenAnswer((realInvocation) async => usersListModel);
      final result = await usersRepositoryImplementation.getAllUsers();

      verify(mockUsersDataSource.getAllUsers());
      expect(result, Right(usersListModel));

    });
  });
}
