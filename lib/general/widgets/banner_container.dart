import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_app/core/data/functions/data_state.dart';
import 'package:game_app/core/data/model/games.dart';
import 'package:game_app/general/widgets/game_banner.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class GameBannerContainer extends StatefulWidget {
  const GameBannerContainer({Key? key}) : super(key: key);

  @override
  _GameBannerContainerState createState() => _GameBannerContainerState();
}

class _GameBannerContainerState extends State<GameBannerContainer> {
  @override
  Widget build(BuildContext context) {
    List<Games> banners = Provider.of<DataState>(context).banners;
    if (banners.isNotEmpty) {
      return CarouselSlider.builder(
          itemCount: banners.take(10).length,
          itemBuilder: (context, index, realIndex) {
            final banner = banners[index];
            return GameBanner(
              image: banner.image,
            );
          },
          options: CarouselOptions(
            autoPlayAnimationDuration: Duration(milliseconds: 1),
            autoPlayInterval: Duration(seconds: 10),
            height: 16.h,
            autoPlay: true,
            viewportFraction: 1,
          ));
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          "assets/images/loading_banner.gif",
          width: MediaQuery.of(context).size.width,
          height: 16.h,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
