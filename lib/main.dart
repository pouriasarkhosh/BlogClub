import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
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

          displayMedium: TextStyle(
            fontFamily: defualtFontFamily,
            fontWeight: FontWeight.w900,
            color: Colors.blue,
            fontSize: 16
          )
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              SizedBox(height: 32),
              _Category(),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 35, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Latest News',style: themeData.textTheme.bodyLarge,),
                  TextButton(onPressed: (){}, child: Text('More',style: themeData.textTheme.displayMedium,))
                ],),
              ),
              _Posts()
            ],
          ),
        ),
      ),
    );
  }
}

class _Posts extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData=Theme.of(context);
    final postDb=AppDatabase.posts;
    return SizedBox(
      child:ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(40, 5, 40, 40),
        scrollDirection: Axis.vertical,
        itemCount: postDb.length,
        itemBuilder: (context,index){
          final post=postDb[index];
        return Container(
          margin: EdgeInsets.only(bottom: 12),       
         height: 150,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
         color: Colors.white,
         boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 2)]
         
         ),
         child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/img/posts/small/${post.imageFileName}')),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(post.caption,style: themeData.textTheme.displayMedium,),
                      SizedBox(height: 4,),
                      Text(post.title,style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400,fontSize: 14),),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.hand_thumbsup,size: 16,),SizedBox(width: 4,),Text(post.likes,style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 0.8),),SizedBox(width: 8,),
                          Icon(CupertinoIcons.clock,size: 16,),SizedBox(width: 4,),Text(post.time,style: themeData.textTheme.bodyMedium!.apply(fontSizeFactor: 0.8)),
                          Expanded(child: Icon(post.isBookmarked?CupertinoIcons.bookmark_fill: CupertinoIcons.bookmark,size: 16,color: Colors.blue,))
                        ],
                      )
                    ],
                  ),
                ),
              )
          ],
         ),
         );
      }) ,
    );
  }
}

class _Category extends StatelessWidget {
  final categoryDb = AppDatabase.categories;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categoryDb.length,
      itemBuilder: (context, index, realindex) {
        final category = categoryDb[index];
        return Stack(
          children: [
            Positioned(
              left: 40,
              right: 40,
              top: 50,
              bottom: 16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 82, 74, 74),
                      
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xff0D253C),
                    Color(0xaa0D253C),
                    Colors.transparent,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 30,
              child: Text(
                category.title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.apply(color: Colors.white),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        aspectRatio: 1.2,
        viewportFraction: 0.7,
        enlargeCenterPage: true,
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
                  story.isViewed
                      ? _viewedStoryItems(themeData, story)
                      : _storyItems(themeData, story),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/img/icons/${story.iconFileName}',
                      width: 24,
                      height: 24,
                    ),
                  ),
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
          colors: [Color(0xff9CECFB), Color(0xff49B0E2), Color(0xff376AED)],
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
            child: Image.asset('assets/img/stories/${story.imageFileName}'),
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
        dashPattern: [7 - 3],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          'assets/img/stories/${story.imageFileName}',
          width: 54,
          height: 54,
        ),
      ),
    ),
  );
}
