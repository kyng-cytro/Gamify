import 'package:flutter/material.dart';
import 'package:game_app/core/auth/functions/auth_state.dart';
import 'package:game_app/core/auth/model/user_model.dart';
import 'package:game_app/general/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthState _state = Provider.of(context, listen: false);
    User _user = _state.user;
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://ui-avatars.com/api/?name=${_user.name}&size=512&background=ffffff&rounded=true",
                  height: 20.h,
                  width: 35.w,
                ),
                SizedBox(height: 2.h),
                Text(
                  _user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 65.w,
                  child: Text(
                    "Your account is ready! Tap on Get Started to proceed.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 12.sp,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed("/home");
                  },
                  child: PrimaryButton(
                    text: "Continue",
                    isloading: false,
                    width: 60.w,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
