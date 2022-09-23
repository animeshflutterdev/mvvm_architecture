import 'package:flutter/foundation.dart';
import 'package:new_mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {

  Future<bool> saveUserInfo(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());

    notifyListeners();

    return true;
  }

  Future<UserModel> getUserInfo() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    return UserModel(token: token.toString());
  }

  Future<bool> removeUserIno() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
    // return sp.clear();
  }
}
