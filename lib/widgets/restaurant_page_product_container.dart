import 'package:flutter/material.dart';

import '../core/text_and_icon.dart';
import '../project_consts.dart';
import 'box_shadow_widget.dart';

class RestaurantPageProductContainerWidget extends StatefulWidget {
  const RestaurantPageProductContainerWidget({Key? key, required this.name, required this.explanation, required this.price, required this.imageUrl, required this.starPoint}) : super(key: key);
  final String name;
  final String explanation;
  final double price;
  final String imageUrl;
  final double starPoint;
  @override
  State<RestaurantPageProductContainerWidget> createState() => _RestaurantPageProductContainerWidgetState();
}

class _RestaurantPageProductContainerWidgetState extends State<RestaurantPageProductContainerWidget> with _SizeUtility,ProjectBorderRadius{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalXBottomPadding,

      ///general Container
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadowUtility.projectShadow(
                blurRadius: 4)
          ],
          borderRadius: smallXBorderRadius,
        ),
        height: generalHeigth,
        child: Row(children: [
          ///image container
          _imageContainer(),

          ///information container
          SizedBox(
            width: informationContainerSize,
            height: generalHeigth,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                ///product name text and leave product icon
                _titleAndIcon(context),

                ///explanation text
                _explanationText(context),

                ///price text and star!
                _priceAndIconStar(context),

                ///product add to card and plus icon,minus icon
                _addOrRemoveAndAddToCartButton(context)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  SizedBox _addOrRemoveAndAddToCartButton(BuildContext context) {
    return SizedBox(
                width: informationContainerSize,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    ///Add boxes
                    SizedBox(
                      height: addOrRemoveSize,
                      child: Row(
                        children: [
                          _addOrRemove(
                              child: Text(
                                "—",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge,
                              )),
                          SizedBox(
                            width: addOrRemoveSize,
                            child: const Center(
                                child: Text("1")),
                          ),
                          _addOrRemove(
                              child: const Icon(
                                  Icons.add))
                        ],
                      ),
                    ),

                    ///Add to cart Button
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color: ProjectColors
                              .orangeAccent,
                          borderRadius:
                          smallXBorderRadius,
                        ),
                        child: Center(
                            child: Text(
                              "Add to cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall,
                            )),
                      ),
                    ),
                  ],
                ),
              );
  }

  Row _priceAndIconStar(BuildContext context) {
    return Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                        fontWeight:
                        FontWeight.w500),
                  ),
                  TextAndIcon(
                    icon: Icons.star,
                    title: widget.starPoint.toString(),
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium,
                  ),
                ],
              );
  }

  Text _explanationText(BuildContext context) {
    return Text(
                widget.explanation,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(
                    color: Colors.black87,
                    overflow:
                    TextOverflow.ellipsis),
              );
  }

  Row _titleAndIcon(BuildContext context) {
    return Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge,
                  ),

                  ///icon button favorite
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite,
                        color: ProjectColors.grey,
                      )),
                ],
              );
  }

  Padding _imageContainer() {
    return Padding(
          padding: ProjectPaddings.normalAllPadding,
          child: Container(
            width: imageContainerSize,
            height: imageContainerSize,
            decoration: BoxDecoration(
                color: const Color(0xfff2f2f2),
                //imageContainerColor
                borderRadius: smallXBorderRadius,
                image: DecorationImage(
                    image: AssetImage(
                        widget.imageUrl),
                    fit: BoxFit.cover)),
          ),
        );
  }

  InkWell _addOrRemove({required Widget child}) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: ProjectColors.white,
            boxShadow: [BoxShadowUtility.projectShadow(blurRadius: 1)]),
        width: 25,
        child: Center(child: child),
      ),
    );
  }
}


class _SizeUtility {
  final double generalHeigth = 120;
  final double imageContainerSize = 120;
  final double informationContainerSize = 230;
  final double addOrRemoveSize = 25;
  final double buttonWidth = 80;
  final double buttonHeight = 35;
}