import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_mvvm/model/user_model.dart';
import 'package:new_mvvm/repository/auth_repository.dart';
import 'package:new_mvvm/utils/routes/routes_name.dart';
import 'package:new_mvvm/utils/utils.dart';
import 'package:new_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  // loading for login
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // loading for signup
  bool _signupLoading = false;

  bool get signupLoading => _signupLoading;

  setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApiViewModel(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUserInfo(
        UserModel(
          token: value['token'].toString(),
        ),
      );
      Utils().showMessage(value.toString(), Colors.green);
      if (kDebugMode) {
        print("login AuthViewModel Value $value");
      }
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils().showMessage(error.toString(), Colors.red);
      if (kDebugMode) {
        print("login AuthViewModel error $error");
      }
    });
  }

  Future<void> registerApiViewModel(dynamic data, BuildContext context) async {
    setSignupLoading(true);

    _myRepo.registerApi(data).then((value) {
      setSignupLoading(false);
      Utils().showMessage(value.toString(), Colors.green);
      Navigator.pushReplacementNamed(context, RoutesName.home);
      if (kDebugMode) {
        print("register AuthViewModel Value $value");
      }
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Utils().showMessage(error.toString(), Colors.red);
      if (kDebugMode) {
        print("register AuthViewModel error $error");
      }
    });
  }
}
