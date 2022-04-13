import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_app/core/data/functions/data_state.dart';
import 'package:game_app/core/data/model/games.dart';
import 'package:game_app/general/widgets/background_slider.dart';
import 'package:game_app/general/widgets/banner_container.dart';
import 'package:game_app/general/widgets/game_container.dart';
import 'package:game_app/general/widgets/menu_buttons.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final CarouselController _slider = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<Games> sliders = Provider.of<DataState>(context).sliders;
    return Scaffold(
      backgroundColor: Color(0xff242E3B),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 45.h,
                child: Stack(
                  children: [
                    (sliders.isNotEmpty)
                        ? CarouselSlider.builder(
                            carouselController: _slider,
                            itemCount: sliders.length,
                            itemBuilder: (context, index, realIndex) {
                              final slider = sliders[index];
                              return BackgroundSlider(
                                image: slider.image,
                                header: slider.name,
                                current: index,
                                active: activeIndex,
                                controller: _slider,
                              );
                            },
                            options: CarouselOptions(
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1),
                              autoPlayInterval: Duration(seconds: 30),
                              height: 50.h,
                              autoPlay: true,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                          )
                        : Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff242E3B),
                                      Colors.transparent
                                    ],
                                  ).createShader(Rect.fromLTRB(
                                      0, 0, rect.width, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Image.asset(
                                  "assets/images/loading_banner.gif",
                                  width: MediaQuery.of(context).size.width,
                                  height: 50.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 12.w,
                                              height: 6.h,
                                              child: ImageIcon(
                                                AssetImage(
                                                    "assets/icons/left_arrow_icon_gray.png"),
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              width: 12.w,
                                              height: 6.h,
                                              child: ImageIcon(
                                                AssetImage(
                                                    "assets/icons/right_arrow_icon_gray.png"),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                    MenuButtons(
                      menu: () {},
                      notification: () {},
                      search: () {
                        Navigator.of(context).pushNamed("/search");
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.h,
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: const GameContainer(
                          reversed: false,
                        ),
                      ),
                      SizedBox(height: .7.h),
                      GameBannerContainer(),
                      SizedBox(height: 3.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: const GameContainer(
                          reversed: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
