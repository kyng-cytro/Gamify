import 'dart:async';
import 'package:flutter/material.dart';
import 'package:game_app/core/auth/functions/auth_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checklogin(context);
    super.initState();
  }

  _checklogin(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("loggedin") != null &&
        prefs.getBool("loggedin") == true) {
      try {
        await Provider.of<AuthState>(context, listen: false).checkedloggedin();
      } catch (e) {
        print(e);
        Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed("/login"),
        );
        return;
      }
      if (Provider.of<AuthState>(context, listen: false).isLoggedIn) {
        Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed("/home"),
        );
      } else {
        Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacementNamed("/login"),
        );
      }
      return;
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed("/login"),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/background-3.png"),
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/app_icon.png",
            height: 30.h,
            width: 30.w,
          ),
        ),
      ),
    );
  }
}
