import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';

class TopStudentsWidgets extends StatelessWidget {
  const TopStudentsWidgets({Key? key, required this.rank, required this.studentsName}) : super(key: key);
  final String rank, studentsName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.height150,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: Dimensions.height150 - Dimensions.height20,
              height: Dimensions.height150 - Dimensions.height20,
              decoration: BoxDecoration(
                color: AppColors.black,
                border: Border.all(color: AppColors.blueColor, width: 2),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              top: 5,
              bottom: 5,
              left: 5,
              right: 5,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              right: 30,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.blueColor,
                ),
                height: Dimensions.height20 * 1.2,
                child: Center(
                  child: BigText(
                    text: rank,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                    size: Dimensions.font16,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30 * 5),
                  color: AppColors.lightBlueColor,
                ),
                height: Dimensions.height20 * 1.5,
                padding: EdgeInsets.all(Dimensions.width10 / 1.5),
                child: Center(
                  child: BigText(
                    text: studentsName,
                    fontWeight: FontWeight.w600,
                    color: AppColors.bgColor,
                    size: Dimensions.font16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
