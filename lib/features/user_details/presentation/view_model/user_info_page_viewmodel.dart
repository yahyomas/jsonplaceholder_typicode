import 'package:demo_app/core/locator/locator.dart';
import 'package:demo_app/features/user_details/domain/entities/album.dart';
import 'package:demo_app/features/user_details/domain/entities/post.dart';
import 'package:demo_app/features/user_details/domain/entities/user/user_info.dart';
import 'package:demo_app/features/user_details/domain/usecases/get_user_albums.dart';
import 'package:demo_app/features/user_details/domain/usecases/get_user_data.dart';
import 'package:demo_app/features/user_details/domain/usecases/get_user_posts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserInfoPageViewModel extends BaseViewModel {
  GetUserData getUserData;
  GetUserAlbums getUserAlbums;
  GetUserPosts getUserPosts;

  UserInfoPageViewModel(
      {required this.getUserData,
      required this.getUserPosts,
      required this.getUserAlbums});

  late SnackbarService snackBarService;
  late int userId;
  late UserInfo userInfo;
  UserPosts? userPosts;
  UserAlbums? userAlbums;
  String? errorText;

  bool _loading = true;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void init({required int id}) {
    snackBarService = getIt<SnackbarService>();
    userId = id;
    getUserInfo();
    getUserPost();
    getUserAlbum();
  }

  Future<void> getUserInfo() async {
    final res = await getUserData(userId);
    setLoading(false);
    res.fold((error) {
      snackBarService.showSnackbar(message: error.props[0]);
      errorText = error.props[0];
    }, (uInfo) {
      userInfo = uInfo;
      notifyListeners();
    });
  }

  Future<void> getUserPost() async {
    final res = await getUserPosts(userId);
    res.fold((error) {
      snackBarService.showSnackbar(message: error.props[0]);
    }, (posts) {
      userPosts = posts;
      notifyListeners();
    });
  }

  Future<void> getUserAlbum() async {
    final res = await getUserAlbums(userId);
    res.fold((error) {
      snackBarService.showSnackbar(message: error.props[0]);
    }, (albums) {
      userAlbums = albums;
      notifyListeners();
    });
  }
}
