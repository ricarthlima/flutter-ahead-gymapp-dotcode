import 'dart:convert';

import 'package:gym_app/shared/constants/preferences_keys.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaoUser {
  void saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }

  Future<LoginModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(PreferencesKeys.activeUser) != null) {
      return LoginModel.fromJson(
        json.decode(prefs.getString(PreferencesKeys.activeUser)!),
      );
    }

    return null;
  }

  void clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(PreferencesKeys.activeUser);
  }
}
