import 'package:flutter/material.dart';
import 'package:game_app/general/pages/account_confirmation.dart';
import 'package:game_app/general/pages/forgot_pass.dart';
import 'package:game_app/general/pages/home.dart';
import 'package:game_app/general/pages/login.dart';
import 'package:game_app/general/pages/search.dart';
import 'package:game_app/general/pages/signup.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/forgot':
        return MaterialPageRoute(builder: (_) => ForgotPass());
      case '/confirm':
        return MaterialPageRoute(builder: (_) => ConfirmPage());
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
