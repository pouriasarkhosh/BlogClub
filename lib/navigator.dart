import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_club/article.dart';
import 'package:flutter_blog_club/home.dart';
import 'package:flutter_blog_club/menu.dart';
import 'package:flutter_blog_club/search.dart';

class MyNavigatorBar extends StatelessWidget {
  const MyNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(height: 82, decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
              color: Colors.black12,blurRadius: 8
            )]),),
          ),
          Positioned(
            right: 1,
            left: 1,
            child: Container(
              alignment: Alignment.topCenter,
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.white,width: 4),
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary
              ),
              child: Center(child: Icon(CupertinoIcons.plus,color: Colors.white,size: 32,)),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(child: _NavigatorItem(iconName: 'Home.png', activeIconName: 'HoameActive.png', title: 'Home', onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())); },)),
            Expanded(child: _NavigatorItem(iconName: 'Articles.png', activeIconName: 'ArticlesActive.png', title: 'Article', onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArticleScreen())); },)),
            SizedBox(width: 60,),
            Expanded(child: _NavigatorItem(iconName: 'Search.png', activeIconName: 'SearchActive.png', title: 'Search', onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen())); },)),
            Expanded(child: _NavigatorItem(iconName: 'Menu.png', activeIconName: 'MenuActive.png', title: 'Menu', onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MenuScreen())); },)),
          ],)
        ],
      ),
    );
  }
}

class _NavigatorItem extends StatelessWidget {
  final String iconName;
  final String activeIconName;
  final String title;
  final Function() onTap;

  const _NavigatorItem({required this.iconName, required this.activeIconName, required this.title, required this.onTap});
  

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData=Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icons/$iconName',width: 32,height: 32,),
          Text(title,style: themeData.textTheme.labelSmall,)
        ],
      ),
    );
  }
}
