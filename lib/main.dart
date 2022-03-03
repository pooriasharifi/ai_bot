import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/views/candle.dart';
import 'package:ai_bot/screen/views/home.dart';
import 'package:ai_bot/screen/views/login.dart';
import 'package:ai_bot/screen/views/signal.dart';
import 'package:ai_bot/screen/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/bottomNav.dart';
import 'modules/preference.dart';

Future<void> main() async {
  runApp(MyApp());
  await SimpleUserPreferences.init();
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: wh
        ),
        // headline2: TextStyle(
        //   fontSize: 30,
        //   fontWeight: FontWeight.w900,
        //   color: wh.withOpacity(1),
        //
        // ),
        headline3: TextStyle(
          fontSize: 18,
          color: wh,

        ),
        subtitle1: TextStyle(
          fontSize: 16,
          color: backLight,

        )
      ),
      backgroundColor: background,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: wh.withOpacity(1),

        ),
        color: background,
        centerTitle: false,

      )
    ),
    home: SplashPage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>SplashPage()),
        GetPage(name: '/login', page: ()=>LoginPage()),
        GetPage(name: '/home', page: ()=>HomePage()),
        GetPage(name: '/menu', page: ()=>BottomNavBar()),
        GetPage(name: '/signal', page: ()=>SignalPage()),
        GetPage(name: '/candle', page: ()=>CandlePage()),
      ],
    );
  }
}

