import 'package:flutter/material.dart';
import 'package:new_mvvm/utils/routes/routes_name.dart';
import 'package:new_mvvm/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUserInfo();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) {
      if (value.token == "" || value.token == "null") {
        debugPrint("if -- ${value.token}");
        Future.delayed(const Duration(seconds: 2),
            () => Navigator.pushNamed(context, RoutesName.login));

      } else {
        debugPrint("elif -- ${value.token}");
        Future.delayed(const  Duration(seconds: 2),
            () => Navigator.pushNamed(context, RoutesName.home));
      }
    }).onError((error, stackTrace) {
      debugPrint("Error in splash services - $error");
    });
  }
}
