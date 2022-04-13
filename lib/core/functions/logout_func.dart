import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutFunc({context, state}) async {
  var res = await state.logout();
  if (res == true) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("loggedin", false);
    final snackBar = SnackBar(
      content: Text("Logged Out"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.popAndPushNamed(context, "/login");
  } else {
    final snackBar = SnackBar(
      content: Text("Error Logging you out."),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
