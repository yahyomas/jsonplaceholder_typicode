import 'package:demo_app_bloc/core/locator/locator.dart';
import 'package:demo_app_bloc/features/user_albums/domain/entities/album_details.dart';
import 'package:demo_app_bloc/features/user_albums/domain/usecases/get_album_photos.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlbumPhotosPageViewModel extends BaseViewModel {
  final GetAlbumPhotos getAlbumPhotos;

  AlbumPhotosPageViewModel({required this.getAlbumPhotos});

  late SnackbarService snackBarService;

  AlbumPhotosList? albumPhotos;

  void init(int albumId) {
    snackBarService = getIt<SnackbarService>();
    getData(albumId);
  }

  Future<void> getData(int albumId) async {
    final res = await getAlbumPhotos(albumId);
    res.fold((error) {
      snackBarService.showSnackbar(message: error.props[0]);
    }, (aPhotos) {
      albumPhotos = aPhotos;
      notifyListeners();
    });
  }
}
