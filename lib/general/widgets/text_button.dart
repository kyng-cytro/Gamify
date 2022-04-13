import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class TxtButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback callback;
  const TxtButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}
