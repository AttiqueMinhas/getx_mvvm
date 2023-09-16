import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

import '../../../repository/login_repository/login_repository.dart';

class LoginViewModel extends GetxController {
  UserPreferences userPreferences = UserPreferences();
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      if (value != null) {
        print(1);
        print(value);
      }
      loading.value = false;
      if (value['error'] == "user not found") {
        Utils.SnackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);
        userPreferences.saveUser(userModel).then((value) {
          Get.toNamed(RouteName.homeView);
        }).onError((error, stackTrace) {});
        Utils.SnackBar('Login', "Successfull login");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.SnackBar('Error', error.toString());
    });
  }
}
