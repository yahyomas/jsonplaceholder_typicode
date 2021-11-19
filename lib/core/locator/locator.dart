import 'package:demo_app/features/user_albums/data/datasources/albums_data_source.dart';
import 'package:demo_app/features/user_albums/data/repository_impl/albums_repository_impl.dart';
import 'package:demo_app/features/user_albums/domain/repositories/albums_repository.dart';
import 'package:demo_app/features/user_albums/domain/usecases/get_album_photos.dart';
import 'package:demo_app/features/user_albums/presentation/viewmodel/album_photos_page_view_model.dart';
import 'package:demo_app/features/user_details/data/datasources/user_info_datasourcce.dart';
import 'package:demo_app/features/user_details/data/repositories_impl/user_info_repository_impl.dart';
import 'package:demo_app/features/user_details/domain/repositories/user_info_repository.dart';
import 'package:demo_app/features/user_details/domain/usecases/get_user_albums.dart';
import 'package:demo_app/features/user_details/domain/usecases/get_user_data.dart';
import 'package:demo_app/features/user_details/domain/usecases/get_user_posts.dart';
import 'package:demo_app/features/user_details/presentation/view_model/user_info_page_viewmodel.dart';
import 'package:demo_app/features/user_posts/data/datasources/post_data_source.dart';
import 'package:demo_app/features/user_posts/data/repository_impl/post_repository_impl.dart';
import 'package:demo_app/features/user_posts/domain/repositories/posts_repostory.dart';
import 'package:demo_app/features/user_posts/domain/usecases/get_post_comments.dart';
import 'package:demo_app/features/user_posts/domain/usecases/leave_comment.dart';
import 'package:demo_app/features/user_posts/presentation/viewmodel/post_comments_page_viewmodel.dart';
import 'package:demo_app/features/users_list/data/datasources/users_data_source.dart';
import 'package:demo_app/features/users_list/data/repositories_impl/users_repository_impl.dart';
import 'package:demo_app/features/users_list/domain/repositories/users_repository.dart';
import 'package:demo_app/features/users_list/domain/usecases/get_all_users.dart';
import 'package:demo_app/features/users_list/presentation/view_model/users_page_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  ///api client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  ///stacked services
  getIt.registerLazySingleton<SnackbarService>(() => SnackbarService());

  ///get users list feature
  getIt.registerLazySingleton<UsersDataSource>(
      () => UsersDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImplementation(usersDataSource: getIt()));
  getIt.registerLazySingleton<GetAllUsers>(() => GetAllUsers(getIt()));
  getIt.registerFactory(() => UsersPageViewModel(getAllUsers: getIt()));

  ///get user info feature
  getIt.registerLazySingleton<UserInfoDataSource>(
      () => UserInfoDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<UserInfoRepository>(
      () => UserInfoRepositoryImplementation(userInfoDataSource: getIt()));
  getIt.registerLazySingleton(() => GetUserData(repository: getIt()));
  getIt.registerLazySingleton(() => GetUserPosts(repository: getIt()));
  getIt.registerLazySingleton(() => GetUserAlbums(repository: getIt()));
  getIt.registerFactory(() => UserInfoPageViewModel(
      getUserData: getIt(), getUserAlbums: getIt(), getUserPosts: getIt()));

  ///album photos
  getIt.registerLazySingleton<AlbumsDataSource>(
      () => AlbumsDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<AlbumsRepository>(
      () => AlbumsRepositoryImplementation(albumsDataSource: getIt()));
  getIt.registerLazySingleton(() => GetAlbumPhotos(repository: getIt()));
  getIt
      .registerFactory(() => AlbumPhotosPageViewModel(getAlbumPhotos: getIt()));

  ///post comments
  getIt.registerLazySingleton<PostsDataSource>(
      () => PostsDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<PostsRepository>(
      () => PostsRepositoryImpl(datasource: getIt()));
  getIt.registerLazySingleton(() => GetPostComments(repository: getIt()));
  getIt.registerLazySingleton(() => LeaveComment(repository: getIt()));
  getIt.registerFactory(() => PostCommentsPageViewModel(
      getPostComments: getIt(), leaveComment: getIt()));
}
