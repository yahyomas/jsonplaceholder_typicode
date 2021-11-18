import 'package:demo_app_bloc/core/locator/locator.dart';
import 'package:demo_app_bloc/features/users_list/domain/entities/user.dart';
import 'package:demo_app_bloc/features/users_list/domain/usecases/get_all_users.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersPageViewModel extends BaseViewModel{
  GetAllUsers getAllUsers;
  UsersPageViewModel({required this.getAllUsers});

  late SnackbarService snackBarService;

  late UsersList _usersList;
  UsersList get usersList => _usersList;



  bool _loading = true;
  bool get loading => _loading;
  void setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }

  void init(){
    snackBarService = getIt<SnackbarService>();
    _usersList = UsersList(myList: []);
    getData();
  }


  Future<void> getData()async {
    final res = await getAllUsers();
    setLoading(false);
    res!.fold((error) {
      snackBarService.showSnackbar(message: error.props[0]);
    }, (list) {
      _usersList = list;
      notifyListeners();
    });
  }

}