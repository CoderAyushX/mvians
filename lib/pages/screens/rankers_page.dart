import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/pages_widgets/ranker_page_widgets/top_students_widget.dart';
import 'package:mvians/widgets/smalltext.dart';

class RankerPage extends StatelessWidget {
  const RankerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? header
            header(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ToppersWidget(whichClass: "Class 12th - commerce"),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Divider(color: AppColors.whiteColor),
                  const ToppersWidget(whichClass: "Class 12th - PCM"),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Divider(color: AppColors.whiteColor),
                  const ToppersWidget(whichClass: "Class 12th - PCB"),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Divider(color: AppColors.whiteColor),
                  const ToppersWidget(whichClass: "Class 10th"),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Divider(color: AppColors.whiteColor),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  footer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


//* header
  Widget header() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: Dimensions.height150 * 1.4,
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radius30),
          bottomRight: Radius.circular(Dimensions.radius30),
        ),
        boxShadow: const [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75)),
        ],
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/topper_bg.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigText(
              text: "Manan vidya toppers",
              size: Dimensions.font30,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SmallText(
              text: "Session 2022-2023",
              size: Dimensions.font18,
            ),
          ],
        ),
      ),
    );
  }
}


//* footer
Widget footer() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    height: Dimensions.height150 * 1.4,
    decoration: BoxDecoration(
      color: AppColors.blueColor,
      borderRadius: BorderRadius.circular(Dimensions.radius30),
      boxShadow: const [
        BoxShadow(
            color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75)),
      ],
      image: const DecorationImage(
        image: NetworkImage(
          "https://img.freepik.com/premium-vector/blue-white-balloon-celebration-background-festive-balloons-illustration-vector-format_29865-4012.jpg?w=2000",
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(
            text: "Congrats toppers",
            size: Dimensions.font30,
            fontWeight: FontWeight.w600,
            color: AppColors.bgColor,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          BigText(
            text:
                "You have made yourself and your parents proud of you.Many many congratulations to you..",
            size: Dimensions.font18,
            color: AppColors.lightDarkColor,
            overflow: TextOverflow.visible,
            align: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

//? toppers widgets

class ToppersWidget extends StatelessWidget {
  const ToppersWidget({Key? key, required this.whichClass}) : super(key: key);

  final String whichClass;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height15,
        ),
        BigText(
          text: whichClass,
          size: Dimensions.font22,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopStudentsWidgets(rank: "2nd", studentsName: "Rudransh raj"),
            TopStudentsWidgets(rank: "1st", studentsName: "Ayush kumar"),
            TopStudentsWidgets(rank: "3rd", studentsName: "Rahul Roy"),
          ],
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TopStudentsWidgets(rank: "4th", studentsName: "Joshua dhan"),
            TopStudentsWidgets(rank: "5th", studentsName: "Chote ram"),
          ],
        ),
      ],
    );
  }
}
