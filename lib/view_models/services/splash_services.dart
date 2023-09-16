import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences.getUser().then((Value) {
      if (Value.isLogin == false || Value.isLogin.toString() == 'null') {
        Timer(Duration(seconds: 5), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(Duration(seconds: 5), () => Get.toNamed(RouteName.homeView));
      }
    });
  }
}
