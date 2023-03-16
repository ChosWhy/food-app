import 'package:flutter/material.dart';

import '../core/text_and_icon.dart';
import '../datas/general_datas.dart';
import '../project_consts.dart';
import 'box_shadow_widget.dart';

class InfoOfRestaurant extends StatefulWidget {
  const InfoOfRestaurant({
    super.key,
 required this.name, required this.location, required this.starPoint, required this.timer,
  });
  final String name;
  final String location;
  final double starPoint;
  final String timer;

  @override
  State<InfoOfRestaurant> createState() => _InfoOfRestaurantState();
}

class _InfoOfRestaurantState extends State<InfoOfRestaurant> with _TitlesUtility,_PageUtility{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.smallBottomPadding,
      ///main container
      child: Container(
        height: infoHeigth,
        decoration: BoxDecoration(
          color: ProjectColors.white,
          boxShadow: [
            BoxShadowUtility.projectShadow(blurRadius: 4)
          ],
          borderRadius: smallBorderRadius,
        ),
        child: Padding(
          padding: ProjectPaddings.largeHorizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///restaurant text
                  Text(
                    widget.name,
                    style:
                    Theme.of(context).textTheme.titleMedium,
                  ),
                  ///restaurant location
                  TextAndIcon(
                      title: widget.location,
                      icon: Icons.place_outlined)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextAndIcon(
                      icon: Icons.star, title: "${widget.starPoint}"),
                  TextAndIcon(
                      icon: Icons.timer, title: widget.timer),
                  Text("${ProjectDatas.km} $restaurantAway"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class _PageUtility{
  final double infoHeigth = 60;
  final BorderRadiusGeometry smallBorderRadius = BorderRadius.circular(12);
}
class _TitlesUtility{
  final String restaurantAway = "miles away";
  final String mins = "mins";
  final String tl = "TL";
}