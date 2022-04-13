import 'package:game_app/core/auth/functions/auth_state.dart';
import 'package:game_app/core/functions/dismiss_keyboard.dart';
import 'package:game_app/core/functions/validators.dart';
import 'package:game_app/general/widgets/primary_button.dart';
import 'package:game_app/general/widgets/primary_input.dart';
import 'package:game_app/general/widgets/text_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isloading = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthState _state = Provider.of<AuthState>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () {
          dismissKeyboard(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/background-3.png"),
            ),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/app_icon.png",
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryInput(
                          label: "Email address",
                          hint: "test@email.com",
                          obscure: false,
                          controller: _email,
                        ),
                        SizedBox(height: 5.h),
                        PrimaryInput(
                          label: "Password",
                          hint: "*********",
                          obscure: true,
                          controller: _pass,
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TxtButton(
                              text: "Forgot password?",
                              color: Color(0xffC4C4C4),
                              callback: () {
                                Navigator.of(context).pushNamed("/forgot");
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 3.h),
                        GestureDetector(
                          onTap: () async {
                            dismissKeyboard(context);
                            var res =
                                LoginVal(email: _email.text, pass: _pass.text)
                                    .validate();
                            if (res == true) {
                              setState(() {
                                _isloading = true;
                              });
                              var res =
                                  await _state.login(_email.text, _pass.text);
                              if (res == true) {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool("loggedin", true);
                                setState(() {
                                  _isloading = false;
                                });
                                Navigator.of(context)
                                    .pushReplacementNamed("/confirm");
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(res.message),
                                );
                                setState(() {
                                  _isloading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(res),
                                ),
                              );
                            }
                          },
                          child: PrimaryButton(
                            text: "Sign in",
                            isloading: _isloading,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Center(
                          child: TxtButton(
                            color: Color(0xffC4C4C4),
                            text: "New user? Sign up here",
                            callback: () {
                              Navigator.of(context).pushNamed("/signup");
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
