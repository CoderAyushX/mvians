import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/onboard_widget/onboard_pages.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //? page builder controller
  late PageController _pageController;

  //* init and dispose of controller
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //? page index for dot indicator
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? bg color for the screen
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoardData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: ((context, index) {
                    return OnBoardPages(
                        title: onBoardData[index].title,
                        image: onBoardData[index].image,
                        desc: onBoardData[index].desc);
                  }),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: Dimensions.width20, bottom: Dimensions.height15),
                child: Row(
                  children: [
                    ...List.generate(
                        onBoardData.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DotIndicator(
                                isActive: index == _pageIndex,
                              ),
                            )),
                    const Spacer(),

                    //* next button
                    _pageIndex != 2
                        ? SizedBox(
                            height: Dimensions.height30 * 2,
                            width: Dimensions.height30 * 2,
                            child: ElevatedButton(
                                onPressed: (() {
                                  _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                }),
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder()),
                                child: Icon(
                                  CupertinoIcons.arrow_right,
                                  color: AppColors.whiteColor,
                                )),
                          )
                        : SizedBox(
                            height: Dimensions.height30 * 2,
                            width: Dimensions.height30 * 2,
                            child: ElevatedButton(
                                onPressed: (() {
                                  Get.offAllNamed("/welcome");
                                }),
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder()),
                                child: Icon(
                                  CupertinoIcons.arrow_right,
                                  color: AppColors.whiteColor,
                                )),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//? dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? AppColors.blueColor : AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10)),
    );
  }
}

//? data
class OnBoardData {
  final String title, image, desc;

  OnBoardData({required this.title, required this.image, required this.desc});
}

//! list of data

final List<OnBoardData> onBoardData = [
  OnBoardData(
    title: "Explore the app and find \n A perfect course ",
    image: "assets/images/onboard_first.png",
    desc:
        "This is the official app of manan vidya school  created by school students",
  ),
  OnBoardData(
    title: "Following the Tech Revolution",
    image: "assets/images/onboard_second.png",
    desc: "Now the time has come were everything is shifting toward tech.",
  ),
  OnBoardData(
    title: "Dont't forget to rate us ",
    image: "assets/images/onboard_third.png",
    desc: "Students your feedback values",
  )
];
