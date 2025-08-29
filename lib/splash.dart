import 'package:flutter/material.dart';
import 'package:flutter_blog_club/onboarding.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
    },); 
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/img/background/splash.png',fit: BoxFit.cover,),

          Center(child: SvgPicture.asset('assets/img/icons/LOGO.svg'))
        ],
      ) ,
    );
  }
}