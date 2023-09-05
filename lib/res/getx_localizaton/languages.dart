import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_bar': 'App bar',
          'email_hint': 'Email',
          'password_hint': 'Password',
          'internet_exception':
              "We're unable to show results. \n Please check your internet\n connection.",
          'retry': 'Retry',
          'general_exception':
              "We're unable to process your request. \n Please try again.",
          'welcome_back': "Welcome\n Back",
          'login': "Login",
          'sign_up': "Sign up"
        },
        'ur_PK': {
          'email hint': 'ای میل درج کریں۔',
        }
      };
}
