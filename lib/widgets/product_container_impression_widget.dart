import 'package:flutter/material.dart';
import '../core/text_and_icon.dart';
import '../datas/general_datas.dart';
import '../project_consts.dart';
import 'box_shadow_widget.dart';

class ProductContainerImpressionWidget extends StatefulWidget {
  const ProductContainerImpressionWidget({Key? key, required this.foodName, required this.explanation, required this.price, this.discountedPrice, required this.starPoint, required this.imageUrl}) : super(key: key);
  final String foodName;
  final String explanation;
  final double price;
  final double? discountedPrice;
  final double starPoint;
  final String imageUrl;

  @override
  State<ProductContainerImpressionWidget> createState() => _ProductContainerImpressionWidgetState();
}

class _ProductContainerImpressionWidgetState extends State<ProductContainerImpressionWidget> with ProjectSizes,ProjectBorderRadius{
  final String tl = "TL";
  ProjectPaddings paddings = ProjectPaddings();
  ProjectDatas datas = ProjectDatas();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPaddings.normalXBottomPadding,
      child: Container(
        height: productHeigth,
        decoration: BoxDecoration(
            color: ProjectColors.white,
            borderRadius: smallXBorderRadius,
            boxShadow: [
              BoxShadowUtility.projectShadow(blurRadius: 4)
            ]),
        child: Row(
          children: [
            ///imageContainer
            SizedBox(
              width: menuWidth,
              height: menuWidth,
              child: Image.asset(widget.imageUrl),
            ),
            ///imnformation container
            Padding(
              padding: ProjectPaddings.normalLeftPadding,
              child: SizedBox(
                width: productDetailWidth,
                height: menuWidth,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///top row text and ıcon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.foodName,style: Theme.of(context).textTheme.titleMedium,),
                          InkWell(
                            onTap: (){},
                            child: const Icon(Icons.favorite,color: ProjectColors.grey,),
                          )
                        ],
                      ),
                      ///text two
                      Text(
                        widget.explanation,
                        style:
                        Theme.of(context).textTheme.titleSmall,
                      ),
                      ///text three
                      Text("${widget.discountedPrice} $tl",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                              fontWeight: FontWeight.w400,
                              decoration:
                              TextDecoration.lineThrough)),
                      ///bottom text and icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${widget.price} $tl",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ProjectColors.orangeAccent,fontWeight: FontWeight.w500),),
                          TextAndIcon(title: "${widget.starPoint}", icon: Icons.star,),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
