import 'package:flutter/material.dart';
import 'package:food_app/core/custom_back_button.dart';
import 'package:food_app/dataBase/data_base.dart';
import 'package:food_app/widgets/product_container_impression_widget.dart';
import 'package:food_app/widgets/restaurant_info_widget.dart';
import 'package:food_app/widgets/restaurant_page_menu_container_widget.dart';
import 'datas/general_datas.dart';
import 'project_consts.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.location,
      required this.starPoint,
      this.discount, required this.timer, required this.index})
      : super(key: key);
  final String imageUrl;
  final String name;
  final String location;
  final double starPoint;
  final double? discount;
  final String timer;
  final int index;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with ProjectSizes, ProjectBorderRadius, _TitlesUtility {
  ProjectPaddings paddings = ProjectPaddings();
  ProjectDatas datas = ProjectDatas();

  @override
  Widget build(BuildContext context) {
    final gateAway = DataBase.restaurantDatas.elementAt(widget.index).mostPreferred;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ///backButton
            _topBackButton(),
            Padding(
              padding: ProjectPaddings.normalHorizontalPadding,
              child: Column(
                children: [
                  ///imageContainer
                  _imageContainer(),

                  ///restaurant info
                  InfoOfRestaurant(
                    timer: widget.timer,
                    name: widget.name,
                    location: widget.location,
                    starPoint: widget.starPoint,
                  ),

                  ///title menu
                  _menuText(context),

                  ///ListView.builder menu
                  RestaurantPageMenuContainer(index: widget.index),

                  ///most preferred
                  Padding(
                      padding: ProjectPaddings.normalXBottomPadding,
                      child: _mostPreferredText(context)),


                  //////////////////////////////suanda bu kısmın kısaltmasını bir ifadeye atarak halletmeye calısıyorum
                  ///most preferred
                  ProductContainerImpressionWidget(
                      foodName: gateAway.elementAt(0).foodName,
                      explanation: gateAway.elementAt(0).explanation,
                      price: gateAway.elementAt(0).price,
                      starPoint: gateAway.elementAt(0).starPoint,
                      imageUrl: gateAway.elementAt(0).imageUrl,),
                  ProductContainerImpressionWidget(
                    foodName: gateAway.elementAt(1).foodName,
                    explanation: gateAway.elementAt(1).explanation,
                    price: gateAway.elementAt(1).price,
                    starPoint: gateAway.elementAt(1).starPoint,
                    imageUrl: gateAway.elementAt(1).imageUrl,),
                  ProductContainerImpressionWidget(
                    foodName: gateAway.elementAt(2).foodName,
                    explanation: gateAway.elementAt(2).explanation,
                    price: gateAway.elementAt(2).price,
                    starPoint: gateAway.elementAt(2).starPoint,
                    imageUrl: gateAway.elementAt(2).imageUrl,),
                  ProductContainerImpressionWidget(
                    foodName: gateAway.elementAt(3).foodName,
                    explanation: gateAway.elementAt(3).explanation,
                    price: gateAway.elementAt(3).price,
                    starPoint: gateAway.elementAt(3).starPoint,
                    imageUrl: gateAway.elementAt(3).imageUrl,),
                  ProductContainerImpressionWidget(
                    foodName: gateAway.elementAt(4).foodName,
                    explanation: gateAway.elementAt(4).explanation,
                    price: gateAway.elementAt(4).price,
                    starPoint: gateAway.elementAt(4).starPoint,
                    imageUrl: gateAway.elementAt(4).imageUrl,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _mostPreferredText(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.smallTopPadding,
      child: Row(
        children: [
          Text(
            mostPreferred,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Row _menuText(BuildContext context) {
    return Row(
      children: [
        Text(
          menu,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  Padding _imageContainer() {
    return Padding(
      padding: ProjectPaddings.normalXBottomPadding,
      child: Container(
        height: imageHeigth,
        decoration: BoxDecoration(
            color: ProjectColors.red,
            borderRadius: normalBorderRadius,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.imageUrl,
                ))),
      ),
    );
  }

  Row _topBackButton() {
    return const Row(
      children: [
        CustomBackButton(iconSize: ProjectIconSizes.normalIconSize),
      ],
    );
  }
}

class _TitlesUtility {
  final String menu = "Menu";
  final String mostPreferred = "most preferred";
}

///senaryo ney? senaryo hangi menuye tıklanırsa onunla alakalı olan productlar gelsin
///
