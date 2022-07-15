import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mvians/controller/auth/auth_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,

        //? bottam nav bar
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
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
                  icon: Icons.search,
                  text: "Search",
                ),
                GButton(
                  icon: Icons.explore,
                  text: "Explore",
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Setting",
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            ElevatedButton(
              child: Text("logout"),
              onPressed: () {
                AuthController.instance.signOut();
              },
            ),
            Text("${AuthController.instance.auth.currentUser?.email}")
          ],
        )));
  }
}
