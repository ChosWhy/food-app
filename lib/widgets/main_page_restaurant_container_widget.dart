import 'package:flutter/material.dart';
import 'package:food_app/utilities.dart';
import '../core/text_and_icon.dart';
import '../datas/general_datas.dart';
import '../project_consts.dart';
import '../restaurant_page.dart';
import 'box_shadow_widget.dart';

class RestaurantContainer extends StatefulWidget {
  const RestaurantContainer(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.location,
      required this.starPoint,
      this.discount,
      required this.index})
      : super(key: key);
  final String imageUrl;
  final String name;
  final String location;
  final double starPoint;
  final double? discount;
  final int index;

  @override
  State<RestaurantContainer> createState() => _RestaurantContainerState();
}

class _RestaurantContainerState extends State<RestaurantContainer>
    with ProjectBorderRadius, ProjectSizes, _TitleUtility, NavigatorUtility {
  final double _shippingCost = 10;
  ProjectPaddings paddings = ProjectPaddings();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalXBottomPadding,
      child: InkWell(
        onTap: () {
          navigatorPush(context: context, route: RestaurantPage(
            index: widget.index,
            timer: min,
            starPoint: widget.starPoint,
            location: widget.location,
            imageUrl: widget.imageUrl,
            name: widget.name,
            discount: widget.discount,
          ));
        },
        ///ana kutu restaurant bilgisinin maim pagedeki
        child: Container(
          height: menuWidth,
          decoration: BoxDecoration(
              borderRadius: smallXBorderRadius,
              color: ProjectColors.white,
              boxShadow: [BoxShadowUtility.projectShadow(blurRadius: 1)]),
          child: Row(
            children: [
              _imageContainer(),

              ///bilgilerin kutusu
              _informationContainer(context)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _informationContainer(BuildContext context) {
    return SizedBox(
              height: menuWidth,
              width: productDetailWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///first row area
                  _titleAndDiscountPlace(context),

                  ///second row area
                  _starTimerOpenAndClosePlace()
                ],
              ),
            );
  }

  Row _starTimerOpenAndClosePlace() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextAndIcon(
                        icon: Icons.star,
                        title: widget.starPoint.toString()),
                    TextAndIcon(
                      icon: Icons.timer,
                      title: " $min $_shippingCost TL",
                    ),
                    TextAndIcon(
                        icon: ProjectDatas.time < 24
                            ? Icons.task_alt_outlined
                            : Icons.close,
                        title: ProjectDatas.time < 24 ? open : close,
                        iconColor: ProjectDatas.time < 24
                            ? Colors.green
                            : Colors.red,
                        textStyle: ProjectDatas.time < 24
                            ? _restaurantContainerTextStyleOpen()
                            : _restaurantContainerTextStyleClose()),
                  ],
                );
  }

  Row _titleAndDiscountPlace(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(widget.discount != null
                        ? "${widget.discount}% discount"
                        : ""),
                  ],
                );
  }

  Padding _imageContainer() {
    return Padding(
              padding: _singleUsePadding(),
              child: Container(
                width: menuWidth,
                height: menuWidth,
                decoration: BoxDecoration(
                  borderRadius: smallBorderRadius,
                  image: DecorationImage(
                      image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
                  boxShadow: [BoxShadowUtility.projectShadow(blurRadius: 1)],
                ),
              ),
            );
  }

  EdgeInsets _singleUsePadding() {
    return const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 15);
  }

  TextStyle? _restaurantContainerTextStyleOpen() {
    return Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.green,
        );
  }

  TextStyle? _restaurantContainerTextStyleClose() {
    return Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.red,
        );
  }
}

class _TitleUtility {
  final String open = "Open";
  final String close = "Close";
  final String min = " 30 min";
}
