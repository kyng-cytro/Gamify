import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final bool isloading;
  final double? width;
  PrimaryButton({required this.text, required this.isloading, this.width});
  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: (widget.width != null) ? widget.width : 78.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: widget.isloading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
