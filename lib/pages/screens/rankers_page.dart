import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/pages_widgets/ranker_page_widgets/top_students_widget.dart';

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
                  //* class 12th
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Class 12th",
                    size: Dimensions.font22,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TopStudentsWidgets(
                          rank: "2nd", studentsName: "Rudransh raj"),
                      TopStudentsWidgets(
                          rank: "1st", studentsName: "Ayush kumar"),
                      TopStudentsWidgets(
                          rank: "3rd", studentsName: "Rahul Roy"),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
            fit: BoxFit.cover),
      ),
      child: Center(
        child: BigText(
          text: "Manan vidya toppers",
          size: Dimensions.font30,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
