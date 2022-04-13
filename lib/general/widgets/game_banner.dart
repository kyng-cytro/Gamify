import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/cache_manager.dart';
import 'package:sizer/sizer.dart';

class GameBanner extends StatelessWidget {
  final String image;
  const GameBanner({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          cacheManager: customCacheManager,
          placeholder: (context, url) => Image.asset(
            "assets/images/loading_banner.gif",
            width: MediaQuery.of(context).size.width,
            height: 16.h,
            fit: BoxFit.cover,
          ),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          errorWidget: (context, url, error) {
            return Image.asset(
              "assets/images/not-found.gif",
              width: MediaQuery.of(context).size.width,
              height: 16.h,
              fit: BoxFit.cover,
            );
          },
          imageUrl: image,
        ),
      ),
    );
  }
}
