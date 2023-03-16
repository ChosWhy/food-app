import 'package:flutter/material.dart';

class BoxShadowUtility{
  static BoxShadow projectShadow({required double blurRadius}) {
    return BoxShadow(
        color: Colors.black12,
        blurRadius: blurRadius,
        offset: const Offset(0, 1));
  }
}