import 'package:flutter/material.dart';
import 'package:game_app/core/auth/functions/auth_state.dart';
import 'package:game_app/core/functions/dismiss_keyboard.dart';
import 'package:game_app/core/functions/validators.dart';
import 'package:game_app/general/widgets/primary_button.dart';
import 'package:game_app/general/widgets/primary_input.dart';
import 'package:game_app/general/widgets/text_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isloading = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();
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
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryInput(
                          label: "Full Name",
                          hint: "John Doe",
                          obscure: false,
                          controller: _name,
                        ),
                        SizedBox(height: 5.h),
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
                        SizedBox(height: 5.h),
                        PrimaryInput(
                          label: "Confirm Password",
                          hint: "*********",
                          obscure: true,
                          controller: _confirmpass,
                        ),
                        SizedBox(height: 5.h),
                        GestureDetector(
                          onTap: () async {
                            dismissKeyboard(context);
                            setState(() {
                              _isloading = true;
                            });
                            var res = SignupVal(
                              name: _name.text,
                              email: _email.text,
                              password: _pass.text,
                              confirm: _confirmpass.text,
                            ).validate();
                            if (res == true) {
                              var res = await _state.createaccount(
                                _name.text,
                                _email.text,
                                _pass.text,
                              );
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
                                setState(() {
                                  _isloading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(res),
                                  ),
                                );
                              }
                            } else {
                              setState(() {
                                _isloading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(res),
                                ),
                              );
                            }
                          },
                          child: PrimaryButton(
                            text: "Sign up",
                            isloading: _isloading,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Center(
                          child: TxtButton(
                            color: Color(0xffC4C4C4),
                            text: "Have an account? Sign in here",
                            callback: () {
                              Navigator.pop(context);
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
