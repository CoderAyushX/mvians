import 'package:flutter/material.dart';
import 'package:mvians/utils/dimensions.dart';
import 'package:mvians/widgets/bigtext.dart';
import 'package:mvians/widgets/smalltext.dart';

class OnBoardPages extends StatelessWidget {
  const OnBoardPages(
      {Key? key, required this.title, required this.image, required this.desc})
      : super(key: key);
  //? getting data
  final String title, image, desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        //* image
        Image.asset(image, height: 250),
        const Spacer(),
        BigText(
          text: title,
          fontWeight: FontWeight.w600,
          size: Dimensions.font26,
          align: TextAlign.center,
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        SmallText(
          text: desc,
          textOverflow: TextOverflow.visible,
          size: Dimensions.font18,
          align: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
