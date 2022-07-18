import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  //? to greet student
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            decoration: const BoxDecoration(
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75)),
              ],
            ),
            child: Row(
              children: [
                BigText(
                  text: greeting(),
                  size: Dimensions.font12 * 2,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    color: AppColors.whiteColor,
                  ),
                  splashRadius: 20,
                ),
              ],
            ),
          ),
          //? body
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    SizedBox(
                  height: Dimensions.height10,
                ),
                BigText(
                  text: "Notice board",
                  size: Dimensions.font22,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),

                //*notice board

                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.width10,
                      horizontal: Dimensions.height10,),
                  height: Dimensions.height150 - Dimensions.height15,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  child: Row(
                    children: [
                      //? text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: "Virtual STEM for class 9th and 12th",
                              size: Dimensions.font12 * 2,
                              fontWeight: FontWeight.w700,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: Text(
                                "Read more",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.redColor),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //? image

                      Image.network(
                          "https://i.postimg.cc/T2JxRyyK/Back-to-school-pana.png")
                    ],
                  ),
                ),

                SizedBox(
                  height: Dimensions.height15,
                ),
                //   BigText(
                //   text: "Explore",
                //   size: Dimensions.font22,
                //   fontWeight: FontWeight.bold,
                // ),
                // SizedBox(
                //   height: Dimensions.height10,
                // ),
                // GridView(
                //   physics: const NeverScrollableScrollPhysics(),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 3,
                //     crossAxisSpacing: 20,
                //     mainAxisSpacing: 10,
                //     mainAxisExtent: 50,
                //   ),
                //   shrinkWrap: true,
                //   children: const [
                //     TopButtonCards(),
                //     TopButtonCards(),
                //     TopButtonCards(),
                //     TopButtonCards(),
                //     TopButtonCards(),
                //     TopButtonCards(),
                        
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TopButtonCards extends StatelessWidget {
  const TopButtonCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            color: AppColors.whiteColor,
            size: Dimensions.iconSize24,
          ),
          const BigText(text: "Home")
        ],
      ),
    );
  }
}
