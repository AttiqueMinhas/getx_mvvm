import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    Timer(Duration(seconds: 5), () => Get.toNamed(RouteName.loginView));
  }
}
