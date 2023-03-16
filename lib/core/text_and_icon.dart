import 'package:flutter/material.dart';

class TextAndIcon extends StatelessWidget {
  const TextAndIcon({Key? key, required this.icon, required this.title, this.textStyle, this.iconColor = Colors.orangeAccent}) : super(key: key);
  final IconData icon;
  final String title;
  final TextStyle? textStyle;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        Text(title,style: textStyle,),
      ],
    );
  }
}
