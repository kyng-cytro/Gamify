import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/core/constants/providers.dart';
import 'package:provider/provider.dart';
import 'core/constants/route_gen.dart';
import 'general/widgets/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff2F3844),
      statusBarColor: Color(0xff2F3844),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Gamify',
            theme: ThemeData(
              primaryColor: Color(0xff2F3844),
              fontFamily: "Roboto",
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: Color(0xff4FB948)),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            onGenerateRoute: RouteGen.generateRoute,
          );
        },
      ),
    );
  }
}
