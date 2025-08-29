import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_club/auth.dart';
import 'package:flutter_blog_club/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController=PageController();
    final ThemeData themeData=Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/img/background/onboarding.png'),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(28),topRight: Radius.circular(28),),
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10
                )]
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: AppDatabase.onBoardingItems.length,
                      itemBuilder: (context,index){
                        
                        final onBoard=AppDatabase.onBoardingItems[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 32, 40, 32),
                        child: Column(
                          children: [
                              Text(onBoard.title,style: themeData.textTheme.bodyLarge,textAlign: TextAlign.center,),
                              Text(onBoard.description,style: themeData.textTheme.bodyMedium,textAlign: TextAlign.center)
                          ],
                        ),
                      );
                                    
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      SmoothPageIndicator(
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          strokeWidth: 32,
                          activeDotColor: Colors.blue
                        ),
                        controller: pageController, count: AppDatabase.onBoardingItems.length),

                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AuthScreen()));
                          },
                          child: Container(height: 60,width: 88,decoration: BoxDecoration(
                            color: Colors.blue,borderRadius: BorderRadius.circular(12)
                          ),
                          child: Icon(CupertinoIcons.arrow_right,color: Colors.white,),
                          ),
                        )
                    ],),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}