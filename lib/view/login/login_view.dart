import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_color.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'.tr),
        backgroundColor: AppColor.tealColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginVM.emailController.value,
                      focusNode: loginVM.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.SnackBar('Email', 'Enter Email');
                        }
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginVM.emailFocusNode.value,
                            loginVM.passwordFocusNode.value);
                      },
                      decoration: InputDecoration(hintText: 'email_hint'.tr),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.SnackBar('Password', 'Enter Password');
                        }
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginVM.passwordFocusNode.value,
                            loginVM.emailFocusNode.value);
                      },
                      decoration: InputDecoration(hintText: 'password_hint'.tr),
                    ),
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            RoundButton(
              title: 'Login',
              onPress: () {
                if (_formKey.currentState!.validate()) ;
              },
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
