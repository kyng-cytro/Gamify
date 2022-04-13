import 'package:flutter/material.dart';
import 'package:game_app/core/data/functions/data_state.dart';
import 'package:game_app/core/data/model/games.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'game_tile.dart';

class GameContainer extends StatefulWidget {
  final int? number;
  final bool reversed;
  const GameContainer({Key? key, this.number, required this.reversed})
      : super(key: key);

  @override
  _GameContainerState createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {
  @override
  Widget build(BuildContext context) {
    List<Games> games = List<Games>.from(Provider.of<DataState>(context).games);
    if (games.isNotEmpty) {
      return Row(
        children: [
          for (Games game in (widget.reversed)
              ? games.reversed.take(widget.number != null ? widget.number! : 10)
              : games.take(widget.number != null ? widget.number! : 10))
            Row(
              children: [
                GameTile(
                  image: game.image,
                  header: game.name,
                  cache: true,
                ),
                SizedBox(width: 2.w)
              ],
            ),
        ],
      );
    } else {
      return Row(
        children: [
          for (int x = 0; x < 5; x++)
            Container(
              height: 25.h,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      "assets/images/loading_banner.gif",
                      height: 19.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 2.w)
                ],
              ),
            )
        ],
      );
    }
  }
}
