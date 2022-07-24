import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mvians/controller/home_page_cont/qoutes_model_cont.dart';
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
  final QoutesController _qoutesController = Get.put(QoutesController());

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List pages = [
    MainHomePage(),
    const ExplorePage(),
    const RankerPage(),
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? bottam nav bar
      bottomNavigationBar: Container(
        color: AppColors.lightDarkColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: GNav(
            gap: 8,
            onTabChange: (index) {
              _onItemTapped(index);
            },
            backgroundColor: AppColors.lightDarkColor,
            color: AppColors.whiteColor,
            activeColor: AppColors.whiteColor,
            tabBackgroundColor: AppColors.bgColor,
            padding: const EdgeInsets.all(8.0),
            rippleColor: Colors.grey.shade800,
            tabs: [
              GButton(
                iconColor: AppColors.lightBlueColor,
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                iconColor: AppColors.lightBlueColor,
                icon: Icons.explore,
                text: "Explore",
              ),
              GButton(
                iconColor: AppColors.lightBlueColor,
                icon: CupertinoIcons.chart_bar_alt_fill,
                text: "Rankers",
              ),
              GButton(
                iconColor: AppColors.lightBlueColor,
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
