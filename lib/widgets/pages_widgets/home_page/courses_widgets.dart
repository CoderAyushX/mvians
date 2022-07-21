import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/smalltext.dart';

class CoursesWidgets extends StatefulWidget {
  const CoursesWidgets({Key? key}) : super(key: key);

  @override
  State<CoursesWidgets> createState() => _CoursesWidgetsState();
}

class _CoursesWidgetsState extends State<CoursesWidgets> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.80);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height150 * 2.6,
      child: PageView.builder(
          itemCount: 4,
          padEnds: false,
          controller: _pageController,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.only(right: Dimensions.width45),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75)),
                  ],
                  image: const DecorationImage(
                      image: AssetImage(
                    "assets/images/courses_bg.jpg",
                 ), fit: BoxFit.cover),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      "https://i.postimg.cc/Qt7Tg8dv/Circulatory-system-rafiki.png",
                      height: Dimensions.height150 * 1.5,
                    ),
                  ),
                  BigText(
                    text: "Science maths biology",
                    size: Dimensions.font26,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height10 / 2,
                  ),
                  SmallText(
                    text: "For senior student",
                    size: Dimensions.font18,
                    color: AppColors.whiteColor,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: Dimensions.height35,
                            width: Dimensions.height35,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.timelapse_rounded,
                                color: AppColors.lightBlueColor,
                                size: Dimensions.iconSize24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          const SmallText(text: "1 Year")
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: Dimensions.height35,
                            width: Dimensions.height35,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                            ),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.money_dollar_circle_fill,
                                color: AppColors.lightBlueColor,
                                size: Dimensions.iconSize24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          const SmallText(text: "Rs 30,000")
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            );
          })),
    );
  }
}
