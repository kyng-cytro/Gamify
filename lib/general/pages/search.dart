import 'package:flutter/material.dart';
import 'package:game_app/core/data/functions/data_state.dart';
import 'package:game_app/core/data/model/games.dart';
import 'package:game_app/core/functions/dismiss_keyboard.dart';
import 'package:game_app/general/widgets/custom_appbar.dart';
import 'package:game_app/general/widgets/game_tile.dart';
import 'package:game_app/general/widgets/search_box.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    List<Games> games = Provider.of<DataState>(context).search;
    TextEditingController _search = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Search",
        shownotification: true,
        showsearch: false,
        showsidebar: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 3.h,
        ),
        child: Column(
          children: [
            CustomSearchBox(
              hint: "Sekiro Shadow ...",
              controller: _search,
            ),
            SizedBox(height: 3.h),
            Expanded(
              child: (games.isNotEmpty)
                  ? GestureDetector(
                      onTap: () {
                        dismissKeyboard(context);
                      },
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.w,
                        childAspectRatio: 30.w / 27.h,
                        children: [
                          for (Games game in games)
                            GameTile(
                              cache: false,
                              header: game.name,
                              image: game.image,
                            ),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
