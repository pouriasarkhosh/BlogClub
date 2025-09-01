import 'package:flutter/material.dart';
import 'package:flutter_blog_club/home.dart';

import 'package:flutter_blog_club/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final defualtFontFamily = 'Avenir';
    final Color primaryTextColor = Color(0xff0D253C);
    final Color secoundaryTextColor = Color(0xff2D4379);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFAFBFF),
        colorScheme: ColorScheme.light(brightness: Brightness.light, primary: Color(0xff376AED), onPrimary: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: defualtFontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: primaryTextColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: defualtFontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: secoundaryTextColor,
          ),
          bodySmall: TextStyle(
            fontFamily: defualtFontFamily,
            fontWeight: FontWeight.w200,
            fontSize: 12,
            color: secoundaryTextColor,
          ),

          displayMedium: TextStyle(
            fontFamily: defualtFontFamily,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
            fontSize: 16
          ),
          displaySmall: TextStyle(
            fontFamily: defualtFontFamily,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 14
          ),
          labelSmall: TextStyle(
            fontFamily: defualtFontFamily,
            fontSize: 10,
            color: Color(0xff0047CC),
            fontWeight: FontWeight.bold
          )
        ),
      ),
      home: Stack(
        children: [
          const HomeScreen(),
          Positioned(
            bottom: 0,right: 0,left: 0,
            child: SplashScreen())
        ],
      ),
    );
  }
}