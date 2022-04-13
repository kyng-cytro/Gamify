import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/cache_manager.dart';
import 'package:sizer/sizer.dart';

class GameTile extends StatelessWidget {
  final String image;
  final String header;
  final bool cache;
  const GameTile({
    Key? key,
    required this.image,
    required this.header,
    required this.cache,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 25.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: (cache)
                  ? CachedNetworkImage(
                      cacheManager: customCacheManager,
                      imageUrl: image,
                      errorWidget: (context, url, error) {
                        return Image.asset(
                          "assets/images/not-found.gif",
                          height: 19.h,
                          fit: BoxFit.cover,
                        );
                      },
                      placeholder: (context, url) => Image.asset(
                        "assets/images/loading_banner.gif",
                        height: 19.h,
                        fit: BoxFit.cover,
                      ),
                      height: 19.h,
                      fit: BoxFit.cover,
                    )
                  : FadeInImage.assetNetwork(
                      height: 19.h,
                      fit: BoxFit.cover,
                      image: image,
                      placeholder: "assets/images/loading_banner.gif",
                      imageErrorBuilder: (context, url, error) {
                        return Image.asset(
                          "assets/images/not-found.gif",
                          height: 19.h,
                          fit: BoxFit.cover,
                        );
                      },
                    )),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.only(left: 1.w),
            child: Text(
              header,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
