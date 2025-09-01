import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_club/home.dart';
import 'package:flutter_svg/svg.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [Icon(CupertinoIcons.ellipsis)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Container(
                        height: 290,
                        width: 305,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    width: 84,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Color(0xff9CECFB),
                                          Color(0xff49B0E2),
                                          Color(0xff376AED),
                                        ],
                                      ),
                                    ),
        
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        color: themeData.scaffoldBackgroundColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(18),
                                          child: Image.asset(
                                            'assets/img/stories/story_3.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '@joviedan',
                                        style: themeData.textTheme.bodySmall,
                                      ),
                                      Text(
                                        'Jovi Daniel',
                                        style: themeData.textTheme.bodyLarge!
                                            .apply(fontSizeFactor: 0.8),
                                      ),
                                      Text(
                                        'UX Designer',
                                        style: themeData.textTheme.displayMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Text(
                                'About me',
                                style: themeData.textTheme.bodyLarge!.apply(
                                  fontSizeFactor: 0.8,
                                ),
                              ),
                              Text(
                                'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                                style: themeData.textTheme.bodyMedium!.apply(
                                  fontSizeFactor: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 70,
                    right: 70,
                    bottom: 0,
                    child: Container(
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 20),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 1,
                    right: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                      child: Container(
                        height: 70,
                        width: 231,
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xff2151CD),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: themeData.textTheme.bodyLarge!.apply(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodySmall!.apply(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: themeData.textTheme.bodyLarge!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Following',
                                    style: themeData.textTheme.bodySmall!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: themeData.textTheme.bodyLarge!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Followers',
                                    style: themeData.textTheme.bodySmall!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32,),
            Container(decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(28),topRight: Radius.circular(28)),boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)]
            ),
            child: Column(
              children: [
                Padding(
                   padding: const EdgeInsets.fromLTRB(40, 32, 40, 24),
                  child: Row(
                    children: [
                      Expanded(child: Text('My Posts',style: themeData.textTheme.bodyLarge,)),
                      SvgPicture.asset('assets/img/icons/Grid.svg'),
                      SizedBox(width: 24,),
                      SvgPicture.asset('assets/img/icons/Table.svg')
                    ],
                  ),
                ),
                Posts()
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
