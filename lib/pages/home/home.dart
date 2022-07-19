import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mvians/pages/screens/explore_page.dart';
import 'package:mvians/pages/screens/home_page.dart';
import 'package:mvians/pages/screens/rankers_page.dart';
import 'package:mvians/pages/screens/setting_page.dart';

import 'package:mvians/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List pages = [
    const MainHomePage(),
    const ExplorePage(),
    const RankerPage(),
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      //? bottam nav bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: GNav(
            gap: 8,
            onTabChange: (index) {
              _onItemTapped(index);
            },
            backgroundColor: Colors.black,
            color: AppColors.whiteColor,
            activeColor: AppColors.whiteColor,
            tabBackgroundColor: Colors.grey.shade900,
            padding: const EdgeInsets.all(8.0),
            rippleColor: Colors.grey.shade800,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.explore,
                text: "Explore",
              ),
              GButton(
                icon: CupertinoIcons.chart_bar_alt_fill,
                text: "Rankers",
              ),
              GButton(
                icon: Icons.settings,
                text: "Setting",
              ),
            ],
          ),
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
