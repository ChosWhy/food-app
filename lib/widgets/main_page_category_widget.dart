import 'package:flutter/material.dart';
import 'package:food_app/project_consts.dart';
import '../datas/general_datas.dart';
import 'box_shadow_widget.dart';

class CategoryOfMenuContainer extends StatelessWidget with ProjectBorderRadius,ProjectSizes{
  CategoryOfMenuContainer({Key? key}) : super(key: key);
  ProjectPaddings paddings = ProjectPaddings();
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: ProjectPaddings.normalXTopPadding,
      child: SizedBox(
        height: menuWidth,
        child: ListView.builder(
          itemCount: ProjectDatas.mainPageMenu.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: index == ProjectDatas.mainPageMenu.length - 1
                ? const EdgeInsets.only(right: 0)
                : ProjectPaddings.normalRightPadding,
            child: InkWell(
              onTap: (){},
              child: Container(
                height: menuWidth,
                width: menuWidth,
                decoration: BoxDecoration(
                  borderRadius: smallXBorderRadius,
                  color: ProjectColors.white,
                  boxShadow: [
                    BoxShadowUtility.projectShadow(blurRadius: 1)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: ProjectPaddings.normalXTopPadding,
                        width: menuImageSize,
                        height: menuImageSize,
                        child: Image.asset(
                            ProjectDatas.mainPageMenu.values
                                .elementAt(index),
                            fit: BoxFit.cover)),
                    Text(
                        ProjectDatas.mainPageMenu.keys.elementAt(index),
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
