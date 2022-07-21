import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';

class TopTeacherWidgets extends StatelessWidget {
  const TopTeacherWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.height150 * 1.1,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: Dimensions.height150,
              height: Dimensions.height150,
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
                    image:
                        NetworkImage('https://i.postimg.cc/SKyt2Z1P/pijus.jpg'),
                    fit: BoxFit.cover,
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
                height: Dimensions.height20 * 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: "pijus sir",
                      fontWeight: FontWeight.w600,
                      color: AppColors.bgColor,
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      color: Colors.blue,
                      size: Dimensions.iconSize16,
                    )
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
