import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/smalltext.dart';

class OnBoardingWelcome extends StatelessWidget {
  const OnBoardingWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? bg color
      backgroundColor: AppColors.bgColor,
      //? sized box to take full height
      body: SizedBox(
        height: double.maxFinite,
        //? stack widget
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //* main image
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.height45,
              ),
              width: Dimensions.screenWidth,
              height: Dimensions.height150 * 2.5,
              child: const Image(
                  image: AssetImage("assets/images/welcome.png"),
                  fit: BoxFit.contain),
            ),
            //? bottam sheet
            Positioned(
              top: Dimensions.height150 * 3,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius30),
                    topRight: Radius.circular(Dimensions.radius30),
                  ),
                  color: AppColors.lightDarkColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                              margin: const EdgeInsets.only(top: 25.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Connect With \nSchool With Our App for ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.redColor,
                          ),
                          children:  [
                            TextSpan(
                                text: 'free!',
                                style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.whiteColor)),
                
                          ],
                        ),
                      ),
                    ),
                 
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    SmallText(
                      text:
                          "Keep Yourself \nupdated abouts What's going on school",
                      color: AppColors.lightRedColor,
                      size: 14,
                    ),
                    const Spacer(),

                    //? next button
                    SizedBox(
                      height: Dimensions.height45 * 1.5,
                      child: ElevatedButton(
                        //? method
                        onPressed: (() {}),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.redColor,
                            textStyle: TextStyle(
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold,
                            )),
                        child: Row(
                          children: const [
                            Text(
                              "Continue ",
                            ),
                            Icon(CupertinoIcons.arrow_right)
                          ],
                        ),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
