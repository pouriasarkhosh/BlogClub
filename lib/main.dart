import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_club/data.dart';

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
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hi, Jonathan!'),
                  Image.asset(
                    'assets/img/icons/notification.png',
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
              child: Text(
                'Explore today’s',
                style: themeData.textTheme.bodyLarge,
              ),
            ),
            _Story(),
          ],
        ),
      ),
    );
  }
}

class _Story extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final storyData = AppDatabase.stories;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        scrollDirection: Axis.horizontal,
        itemCount: storyData.length,
        itemBuilder: (context, index) {
          final story = storyData[index];
          return Column(
            children: [
              Stack(
                children: [
                story.isViewed? _viewedStoryItems(themeData, story):  _storyItems(themeData, story),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset('assets/img/icons/${story.iconFileName}',width: 24,height: 24,))
                ],
              ),
              SizedBox(height: 4),
              Text(story.name, style: themeData.textTheme.bodySmall),
            ],
          );
        },
      ),
    );
  }

  Widget _storyItems(ThemeData themeData, StoryData story) {
    return Container(
                  margin: EdgeInsets.all(5),
                  width: 68,
                  height: 68,
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
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/img/stories/${story.imageFileName}',
                        ),
                      ),
                    ),
                  ),
                );
  }
}
 Widget _viewedStoryItems(ThemeData themeData, StoryData story) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
            
          padding: EdgeInsets.all(6),
          radius: Radius.circular(24),
          strokeWidth: 2,
          color: Color(0xff7B8BB2),
          dashPattern: [7-3]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/img/stories/${story.imageFileName}',width: 54,height: 54,
          ),
        ),
      ),
    );
  }