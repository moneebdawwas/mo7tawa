import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:majlaat/constants/colors.dart';

import 'package:majlaat/screens/categoris.dart';
import 'package:majlaat/screens/home_screen.dart';
import 'package:majlaat/screens/more_screen.dart';
import 'package:majlaat/screens/my_files.dart';
import 'package:majlaat/screens/packages.dart';

class CustomNavigationBar extends StatefulWidget {
  final int? pageIndex;
  const CustomNavigationBar({Key? key, this.pageIndex}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final iconList = <IconData>[
    Icons.home,
    Icons.file_copy,
    Icons.category,
    Icons.pages,
    Icons.menu,
  ];

  var pages = [
    HomeScreen(),
    const MyFilesScreen(),
    const CategorisScreen(),
    const PackagesScreen(),
    const MoreScreen()
  ];
  var titles = <String>[
    'الرئيسية',
    'ملفاتي',
    'التصنيفات',
    'الباقات',
    'المزيد',
  ];

  Future<void> _onItemTapped(int index) async {
    setState(
      () {
        currentIndex = index;
        print("index: $index");
      },
    );
  }

  @override
  void initState() {
    super.initState();

    onCreate();
  }

  onCreate() {
    if (widget.pageIndex == null) {
      currentIndex = 0;
    } else {
      currentIndex = widget.pageIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: pages[currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 70,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.red : Colors.black;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                size: isActive ? 40 : 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  titles[index],
                  style: TextStyle(color: color),
                ),
              )
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: currentIndex,
        splashColor: Colors.yellow,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: _onItemTapped,
        shadow: const BoxShadow(
          offset: Offset(0, 3),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
