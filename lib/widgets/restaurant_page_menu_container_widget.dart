import 'package:flutter/material.dart';
import 'package:food_app/dataBase/data_base.dart';
import 'package:food_app/datas/general_datas.dart';
import 'package:food_app/project_consts.dart';
import 'package:food_app/restaurant_products_page.dart';
import 'package:food_app/utilities.dart';
import 'box_shadow_widget.dart';

class RestaurantPageMenuContainer extends StatefulWidget {
  const RestaurantPageMenuContainer({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<RestaurantPageMenuContainer> createState() =>
      _RestaurantPageMenuContainerState();
}

class _RestaurantPageMenuContainerState
    extends State<RestaurantPageMenuContainer>
    with ProjectSizes, ProjectBorderRadius, NavigatorUtility {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: menuHeigth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: DataBase.menuDatasController.length - 1 == index
                ? const EdgeInsets.only(right: 0)
                : ProjectPaddings.normalRightPadding,
            child: InkWell(
              onTap: () {
                ///her tıkladıgımda ekledim
                ProjectDatas.toggleForBack.add(ProjectDatas.menus[index]);
                _toggleTheMenuBuilderColor(index);
                navigatorPush(
                    context: context,
                    route: ProductByMenuPage(
                      index: widget.index,
                      title: DataBase.restaurantDatas
                          .elementAt(index)
                          .menu
                          .elementAt(index),
                    ));
              },
              child: Container(
                height: menuHeigth,
                width: menuWidth,
                decoration: BoxDecoration(
                    borderRadius: smallXBorderRadius,

                    ////aktiflik pasiflik renk kontrolu bu short if ile
                    color: DataBase.menuDatasController[index] == true
                        ? ProjectColors.orangeAccent
                        : ProjectColors.white,
                    boxShadow: [BoxShadowUtility.projectShadow(blurRadius: 1)]),
                child: Center(
                    child: Text(
                  DataBase.restaurantDatas
                      .elementAt(index)
                      .menu
                      .elementAt(index),
                  style: Theme.of(context).textTheme.titleMedium,
                )),
              ),
            ),
          );
        },
        itemCount: DataBase.restaurantDatas.elementAt(widget.index).menu.length,
      ),
    );
  }

  void _toggleTheMenuBuilderColor(int index) {
    return setState(() {
      if (DataBase.menuDatasController[index] == true) {
        DataBase.menuDatasController[index] = true;
        for (int i = 0; i < DataBase.menuDatasController.length; i++) {
          if (i != index) {
            DataBase.menuDatasController[i] = false;
          }
        }
      } else {
        DataBase.menuDatasController[index] = true;
        for (int i = 0; i < DataBase.menuDatasController.length; i++) {
          if (i != index) {
            DataBase.menuDatasController[i] = false;
          }
        }
      }
    });
  }
}
