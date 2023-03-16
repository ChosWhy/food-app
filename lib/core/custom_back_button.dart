import 'package:flutter/material.dart';
import 'package:food_app/utilities.dart';


class CustomBackButton extends StatelessWidget with NavigatorUtility{
  const CustomBackButton({Key? key, this.iconSize = 25, this.color, this.widget}) : super(key: key);
  final double? iconSize;
  final Color? color;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      widget == null ? Navigator.of(context).pop() : navigatorPush(context: context,route: widget!);
    }, icon: Icon(Icons.keyboard_arrow_left_outlined,size: iconSize,color: color,));
  }
}
