import 'package:flutter/material.dart';

class OnUnKnowPage extends StatelessWidget {
  const OnUnKnowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
      child: Text("Birşeyler ters gitti\n Something are wrong"),
    ));
  }
}
