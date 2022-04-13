import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/cache_manager.dart';
import 'package:sizer/sizer.dart';

class BackgroundSlider extends StatefulWidget {
  final String image;
  final String header;
  final int active;
  final int current;
  final CarouselController controller;
  const BackgroundSlider({
    Key? key,
    required this.image,
    required this.header,
    required this.active,
    required this.controller,
    required this.current,
  }) : super(key: key);

  @override
  _BackgroundSliderState createState() => _BackgroundSliderState();
}

class _BackgroundSliderState extends State<BackgroundSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff242E3B), Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            cacheManager: customCacheManager,
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Image.asset(
              "assets/images/loading_banner.gif",
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) {
              return Image.asset(
                "assets/images/not-found.gif",
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                fit: BoxFit.cover,
              );
            },
            imageUrl: widget.image,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Stack(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          widget.controller.previousPage(
                              duration: Duration(milliseconds: 1));
                        },
                        child: Container(
                          width: 12.w,
                          height: 6.h,
                          child: ImageIcon(
                            AssetImage("assets/icons/left_arrow_icon.png"),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          widget.controller
                              .nextPage(duration: Duration(milliseconds: 1));
                        },
                        child: Container(
                          width: 12.w,
                          height: 6.h,
                          child: ImageIcon(
                            AssetImage("assets/icons/right_arrow_icon.png"),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 65.w,
                        child: Text(
                          widget.header,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Row(
                        children: [
                          for (var x = 0; x < 3; x++)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    widget.controller.jumpToPage(x);
                                  },
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: new BoxDecoration(
                                      color: (x == widget.active)
                                          ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                          : Color(0xffC4C4C4),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 1.w),
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
