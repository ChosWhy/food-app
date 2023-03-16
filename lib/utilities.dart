import 'package:flutter/material.dart';

class NavigatorUtility {
  void navigatorPush(
      {required BuildContext context, required Widget route}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => route,
    ));
  }
}
