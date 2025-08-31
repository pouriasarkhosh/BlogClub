import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme.light(brightness: Brightness.light, primary: Colors.blue, onPrimary: Colors.white),
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
            fontWeight: FontWeight.w900,
            color: Colors.blue,
            fontSize: 16
          ),
          displaySmall: TextStyle(
            fontFamily: defualtFontFamily,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 14
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}