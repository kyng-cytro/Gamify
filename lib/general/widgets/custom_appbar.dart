import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(7.h);

  final String title;
  final bool showsidebar;
  final bool showsearch;
  final bool shownotification;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.showsidebar,
    required this.showsearch,
    required this.shownotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showsidebar
          ? GestureDetector(
              onTap: () {},
              child: Container(
                width: 12.w,
                height: 5.h,
                child: ImageIcon(
                  AssetImage("assets/icons/menu_icon.png"),
                  color: Colors.white,
                ),
              ),
            )
          : null,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
      actions: [
        showsearch
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  width: 12.w,
                  height: 5.h,
                  child: ImageIcon(
                    AssetImage("assets/icons/search_icon.png"),
                    color: Colors.white,
                  ),
                ),
              )
            : Container(),
        shownotification
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  width: 12.w,
                  height: 5.h,
                  child: ImageIcon(
                    AssetImage("assets/icons/notification_icon.png"),
                    color: Colors.white,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
