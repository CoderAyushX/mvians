import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mvians/controller/auth/auth_controller.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/smalltext.dart';

class ComAuthPage extends StatelessWidget {
  const ComAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        //? to get full page width
        child: SizedBox(
          width: double.maxFinite,
          //? geving padding to whole page
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? auth image
                Image.asset(
                  "assets/images/auth.png",
                  height: Dimensions.height150 * 1.8,
                ),
                SizedBox(
                  height: Dimensions.height35,
                ),
                //? Auth body
                Expanded(
                  //? giving padding
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //*texts
                        BigText(
                          text: "Hey There Welcome To\nOur App",
                          size: Dimensions.font16 * 2,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SmallText(
                          text: "Login or signup To Continue to the app",
                          size: Dimensions.font20,
                        ),

                        const Spacer(),
                        //? email button
                        EmailContinueButtons(
                          color: AppColors.redColor,
                          text: "Continue With Email",
                          textColor: AppColors.whiteColor,
                          icon: Icon(
                            Icons.email_outlined,
                            size: Dimensions.iconSize24 * 1.4,
                            color: AppColors.whiteColor,
                          ),
                          nav: "/login",
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),

                        //? google button
                        GoogleContinueButtons(
                          color: AppColors.whiteColor,
                          text: "Continue With Google",
                          textColor: AppColors.lightDarkColor,
                          icon: Icon(FontAwesomeIcons.google,
                              size: Dimensions.iconSize24 * 1.2,
                              color: AppColors.lightDarkColor),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailContinueButtons extends StatelessWidget {
  const EmailContinueButtons(
      {Key? key,
      required this.color,
      required this.text,
      required this.textColor,
      required this.icon,
      required this.nav})
      : super(key: key);

  //? getting datas
  final Color color;
  final Color textColor;
  final String text, nav;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height45 * 1.25,
      width: Dimensions.screenWidth - 10,
      child: ElevatedButton(
        //? method
        onPressed: (() {
          Get.toNamed(nav);
        }),
        style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: TextStyle(
            fontSize: Dimensions.font26,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: Dimensions.width20,
            ),
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleContinueButtons extends StatelessWidget {
  const GoogleContinueButtons({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.icon,
  }) : super(key: key);

  //? getting datas
  final Color color;
  final Color textColor;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height45 * 1.25,
      width: Dimensions.screenWidth - 10,
      child: ElevatedButton(
        //? method
        onPressed: (() {
          AuthController.instance.signInWithGoogle();
        }),
        style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: TextStyle(
            fontSize: Dimensions.font26,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: Dimensions.width20,
            ),
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
