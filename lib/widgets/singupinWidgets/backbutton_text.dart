import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';

class BackButtonForAuth extends StatelessWidget {
  const BackButtonForAuth({Key? key, required this.text ,required this.size}) : super(key: key);
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //? back button
        InkWell(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.all(Dimensions.height10),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.7), width: .8),
              borderRadius: BorderRadius.circular(Dimensions.radius15),
            ),

            //? back icon
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.whiteColor,
              size: Dimensions.iconSize24 * 1.2,
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.width45 * 1.2,
        ),
        //? page header
        BigText(
          text: text,
          size: size,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ],
    );
  }
}
