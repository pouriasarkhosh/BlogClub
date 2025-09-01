import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog_club/article.dart';
import 'package:flutter_blog_club/home.dart';
import 'package:flutter_blog_club/menu.dart';
import 'package:flutter_blog_club/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


final int homeIndex=0;
final int articleIndex=1;
final int searchIndex=2;
final int menuIndex=3;
class _MainScreenState extends State<MainScreen> {

  int defaultSelectedIndex=homeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigatorBar(onScreenTab: (int index) { setState(() {
        defaultSelectedIndex=index;
      }); }, selectedScreen: defaultSelectedIndex,),

      body: IndexedStack(
        index: defaultSelectedIndex,
        children: [HomeScreen(), ArticleScreen(), SearchScreen(), MenuScreen()],
      ),
    );
  }
}

class MyNavigatorBar extends StatelessWidget {
  final Function(int index) onScreenTab;
  final int selectedScreen;
  const MyNavigatorBar({super.key, required this.onScreenTab, required this.selectedScreen});

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
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
            ),
          ),
          Positioned(
            right: 1,
            left: 1,
            child: Container(
              alignment: Alignment.topCenter,
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.white, width: 4),
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Icon(CupertinoIcons.plus, color: Colors.white, size: 32),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _NavigatorItem(
                  iconName: 'Home.png',
                  activeIconName: 'HomeActive.png',
                  title: 'Home',
                  onTap: () {
                    onScreenTab(homeIndex);
                   
                  }, isActive: selectedScreen==homeIndex,
                ),
              ),
              Expanded(
                child: _NavigatorItem(
                  iconName: 'Articles.png',
                  activeIconName: 'ArticlesActive.png',
                  title: 'Article',
                  onTap: () {
                    onScreenTab(articleIndex);
                    
                  },isActive: selectedScreen==articleIndex,
                ),
              ),
              SizedBox(width: 60),
              Expanded(
                child: _NavigatorItem(
                  iconName: 'Search.png',
                  activeIconName: 'SearchActive.png',
                  title: 'Search',
                  onTap: () {
                  onScreenTab(searchIndex);
                  },isActive: selectedScreen==searchIndex,
                ),
              ),
              Expanded(
                child: _NavigatorItem(
                  iconName: 'Menu.png',
                  activeIconName: 'MenuActive.png',
                  title: 'Menu',
                  onTap: () {
                  onScreenTab(menuIndex);
                  },isActive: selectedScreen==menuIndex,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavigatorItem extends StatelessWidget {
  final String iconName;
  final String activeIconName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const _NavigatorItem({
    required this.iconName,
    required this.activeIconName,
    required this.title,
    required this.onTap, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icons/${isActive? activeIconName:iconName}', width: 32, height: 32),
          Text(title, style: themeData.textTheme.labelSmall!.apply(color: isActive? themeData.colorScheme.primary:themeData.textTheme.bodySmall!.color)),
        ],
      ),
    );
  }
}
