import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class PrimaryInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  const PrimaryInput(
      {Key? key,
      required this.label,
      required this.hint,
      required this.obscure,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        SizedBox(height: 1.h),
        TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
              color: Color(0xffFFFFFF)),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffC4C4C4),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 1.w),
            hintText: hint,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
              color: Color(0xffC4C4C4),
            ),
          ),
        ),
      ],
    );
  }
}
