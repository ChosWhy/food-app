import 'package:flutter/material.dart';
import 'package:food_app/core/text_and_icon.dart';
import 'package:food_app/dataBase/data_base.dart';
import 'package:food_app/project_consts.dart';
import 'package:food_app/widgets/box_shadow_widget.dart';
import 'package:food_app/widgets/main_page_category_widget.dart';
import 'package:food_app/widgets/main_page_restaurant_container_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with ProjectBorderRadius, ProjectSizes, _TitleUtility {
  @override
  Widget build(BuildContext context) {
    ProjectPaddings paddings = ProjectPaddings();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ProjectPaddings.normalHorizontalPadding,
          child: Column(
            children: [
              ///text of name
              _topLocationAndNameText(context),

              ///Search Box
              _searchFontEndDesign(paddings, context),

              ///categories Text
              _categoryText(paddings, context),

              ///Categories Boxes
              CategoryOfMenuContainer(),

              ///Text  list of Restaurants
              _restaurantNear(paddings, context),

              ///restaurants
              _restaurantContainerPlace(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _restaurantContainerPlace() {
    return Expanded(
        child: Padding(
      padding: ProjectPaddings.normalXTopPadding,
      child: ListView.builder(
        itemCount: DataBase.restaurantDatas.length,
        itemBuilder: (context, index) => RestaurantContainer(
          index: index,
          name: DataBase.restaurantDatas.elementAt(index).name,
          imageUrl: DataBase.restaurantDatas.elementAt(index).imageUrl,
          location: DataBase.restaurantDatas.elementAt(index).location,
          starPoint: DataBase.restaurantDatas.elementAt(index).starPoint,
          discount: DataBase.restaurantDatas.elementAt(index).discount,
        ),
      ),
    ));
  }

  Padding _topLocationAndNameText(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalTopPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hiTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w500)),
          TextAndIcon(icon: Icons.place_outlined, title: locationTitle),
        ],
      ),
    );
  }

  Padding _searchFontEndDesign(ProjectPaddings paddings, BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalXTopPadding,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ProjectColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadowUtility.projectShadow(blurRadius: 4)],
        ),
        child: Padding(
          padding: ProjectPaddings.normalLeftPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                searchTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _categoryText(ProjectPaddings paddings, BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalXTopPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoriesTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(seeAllTitle),
        ],
      ),
    );
  }

  Padding _restaurantNear(ProjectPaddings paddings, BuildContext context) {
    return Padding(
      padding: ProjectPaddings.smallTopPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            restaurantNearTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(seeAllTitle),
        ],
      ),
    );
  }
}

class _TitleUtility {
  final String hiTitle = "Hi Furkan!";
  final String locationTitle = "Izmır Ege Kent 2 ...";
  final String searchTitle = "Search for your dish";
  final String categoriesTitle = "Categories";
  final String seeAllTitle = "See all";
  final String restaurantNearTitle = "Restaurants near";
}