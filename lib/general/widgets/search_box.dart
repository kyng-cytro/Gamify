import 'package:flutter/material.dart';
import 'package:game_app/core/data/functions/data_state.dart';
import 'package:game_app/core/functions/dismiss_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CustomSearchBox extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomSearchBox(
      {Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        border: Border.all(width: 0),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onEditingComplete: () {
                if (controller.text != "") {
                  dismissKeyboard(context);
                  Provider.of<DataState>(context, listen: false).query =
                      controller.text;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Empty Search Term"),
                    ),
                  );
                }
              },
              controller: controller,
              cursorColor: Theme.of(context).primaryColor,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: Theme.of(context).primaryColor,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: Color(0xffC4C4C4),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (controller.text != "") {
                dismissKeyboard(context);
                Provider.of<DataState>(context, listen: false).query =
                    controller.text;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Empty Search Term"),
                  ),
                );
              }
            },
            child: Container(
              width: 13.w,
              height: 6.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Icon(
                Icons.search,
                size: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
