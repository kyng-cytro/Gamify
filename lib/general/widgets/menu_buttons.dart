import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuButtons extends StatelessWidget {
  final VoidCallback menu;
  final VoidCallback search;
  final VoidCallback notification;
  const MenuButtons(
      {Key? key,
      required this.menu,
      required this.search,
      required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 3.h,
            horizontal: 5.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: menu,
                child: Container(
                  width: 12.w,
                  height: 5.h,
                  child: ImageIcon(
                    AssetImage("assets/icons/menu_icon.png"),
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: search,
                    child: Container(
                      width: 12.w,
                      height: 5.h,
                      child: ImageIcon(
                        AssetImage("assets/icons/search_icon.png"),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: notification,
                    child: Container(
                      width: 12.w,
                      height: 5.h,
                      child: ImageIcon(
                        AssetImage("assets/icons/notification_icon.png"),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
