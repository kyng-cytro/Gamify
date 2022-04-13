import 'package:flutter/material.dart';
import 'package:game_app/core/auth/functions/auth_state.dart';
import 'package:game_app/core/functions/dismiss_keyboard.dart';
import 'package:game_app/general/widgets/primary_button.dart';
import 'package:game_app/general/widgets/primary_input.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  bool _isloading = false;
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthState _state = Provider.of(context, listen: false);
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
              image: AssetImage("assets/images/background-4.png"),
            ),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h, left: 2.5.w),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.chevron_left_outlined,
                            color: Color(0xffC4C4C4),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Container(
                          width: 60.w,
                          child: Text(
                            "Enter the email address you used to create  your account and we will email you a link to reset your password",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Colors.white,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        PrimaryInput(
                          label: "Email address",
                          hint: "test@email.com",
                          obscure: false,
                          controller: _email,
                        ),
                        SizedBox(height: 7.h),
                        GestureDetector(
                          onTap: () async {
                            dismissKeyboard(context);
                            if (_email.text != "") {
                              setState(() {
                                _isloading = true;
                              });
                              var res = await _state.resetpass(_email.text);
                              if (res == true) {
                                setState(() {
                                  _isloading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Please check your email inbox to continue')));
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
                            }
                          },
                          child: PrimaryButton(
                            text: "Submit",
                            isloading: _isloading,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
