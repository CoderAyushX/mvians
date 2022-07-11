import 'package:flutter/cupertino.dart';
import 'package:mvians/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final TextAlign align;
  const BigText(
      {Key? key,
      this.color = const  Color(0xFFE5E5E5),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.w400,
      this.align = TextAlign.start
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size == 0 ? Dimensions.font20 : size),
    );
  }
}
