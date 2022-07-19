import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvians/utils/colors.dart';
import 'package:mvians/utils/dimensions.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  const BaseAppBar({
    Key? key,
    required this.title,
    required this.appBar,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: Dimensions.width20),
            //? notification dot button
            child:     IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      color: Colors.white70,
                    ),
                    splashRadius: 20,
                  ),),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
