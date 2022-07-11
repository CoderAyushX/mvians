import 'package:flutter/material.dart';
import 'package:mvians/pages/onboarding%20pages/onboard_welcome_page.dart';
import 'package:mvians/pages/onboarding%20pages/onboarding_page.dart';
import 'package:mvians/utils/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mvians',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      home: const Scaffold(
        backgroundColor: Color.fromRGBO(247, 251, 252, 1),
              ),
        //* routes
      initialRoute: "/onboard",
      getPages: [
        //! GetPage(name: '/', page: () => const Home()),

        GetPage(name: '/onboard', page: () => const OnBoardingScreen()),
        GetPage(name: '/welcome', page: () => const OnBoardingWelcome()),

      ],
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
