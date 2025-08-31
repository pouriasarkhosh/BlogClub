import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Container(width: 111,height: 48,decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: themeData.colorScheme.primary,blurRadius: 10
        )]
      ),child:Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/icons/Thumbs.svg'),
          SizedBox(width: 8,),
          Text('2.1K',style: TextStyle(fontSize: 18),)
        ],
      ) ,)),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.ellipsis)),
                  SizedBox(width: 10),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 32),
                    child: Text(
                      'Four Things Every Woman Needs To Know',
                      style: themeData.textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/img/stories/story_6.jpg',
                            width: 48,
                            height: 48,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Richard Gervain',
                                style: themeData.textTheme.bodyMedium,
                              ),
          
                              Text('2m ago', style: themeData.textTheme.bodySmall),
                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.share),
                        SizedBox(width: 26),
                        Icon(CupertinoIcons.bookmark),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    child: Image.asset(
                      'assets/img/background/single_post.png',
                      fit: BoxFit.cover,
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 32, 40, 12),
                    child: Text(
                      'A man’s sexuality is never your mind responsibility.',
                      style: themeData.textTheme.bodyLarge!.apply(
                        fontSizeFactor: 0.8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                    ),
                  ),
                  SizedBox(height: 110),
                ]),
              ),
            ],
          ),
          Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xffFAFBFF),
                  Color(0xffFAFBFF).withValues(alpha: 0),
                ],
              ),
            ),
          ),
        ),

        ],

      ),
    );
  }
}
