import 'package:flutter/material.dart';
import 'package:food_app/dataBase/data_base.dart';
import 'package:food_app/project_consts.dart';
import 'package:food_app/widgets/restaurant_page_menu_container_widget.dart';
import 'package:food_app/widgets/restaurant_page_product_container.dart';

import 'datas/product_datas.dart';

class ProductByMenuPage extends StatefulWidget
    with ProjectBorderRadius {
  ProductByMenuPage({Key? key, required this.index, required this.title}) : super(key: key);
  final int index;
  final String title;

  @override
  State<ProductByMenuPage> createState() => _ProductByMenuPageState();
}

class _ProductByMenuPageState extends State<ProductByMenuPage> {
  List<RestaurantProduct> menuProduct = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            ///geri tusuna bastıgında RestaurantPage ye gelsin diyorum
            Navigator.of(context).pop();

          }, icon: const Icon(Icons.keyboard_arrow_left_outlined,size: ProjectIconSizes.normalIconSize,color: Colors.black,)
          ),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            Padding(
              padding: ProjectPaddings.normalRightPadding,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: ProjectIconSizes.smallIconSize,
                  )),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: ProjectPaddings.normalHorizontalPadding,
            child: Column(
              children: [
                ///Menus
                Padding(
                  padding: ProjectPaddings.normalXBottomPadding,
                  child: RestaurantPageMenuContainer(index: widget.index),
                ),

                ///ProductItems
                Expanded(
                  child: ListView.builder(
                    itemCount: _itemCount(),
                      itemBuilder: (context, index) {
                      ///buraya ürünleri listeletmem gerek
                        _doListAndSetToList();
                      return RestaurantPageProductContainerWidget(
                        name: menuProduct.elementAt(index).foodName,
                        price: menuProduct.elementAt(index).price,
                        explanation: menuProduct.elementAt(index).explanation,
                        imageUrl: menuProduct.elementAt(index).imageUrl,
                        starPoint: menuProduct.elementAt(index).starPoint,
                      );
                      }),
                )
              ],
            ),
          ),
        ));
  }

  int _itemCount(){
    int count = 0;
    try{
      if(widget.title.toLowerCase() == "preferred" && DataBase.restaurantDatas.elementAt(widget.index).products != null){
        count = DataBase.restaurantDatas.elementAt(widget.index).products!.length;
      }
      else if(DataBase.restaurantDatas.elementAt(widget.index).products != null){
        for(int i = 0;i< DataBase.restaurantDatas.elementAt(widget.index).products!.length;i++){
          if(DataBase.restaurantDatas.elementAt(widget.index).products!.values.elementAt(i) == widget.title.toLowerCase()){
            count++;
          }
        }
      }
      else{
        throw Exception("Product list is empty");
      }
      return count;
    }
    catch(error){
      print(error);
    }
    return 0;
  }

  void _doListAndSetToList(){
    try{
      if(widget.title.toLowerCase() == "preferred" && DataBase.restaurantDatas.elementAt(widget.index).products != null){
        menuProduct = DataBase.restaurantDatas.elementAt(widget.index).products!.keys.toList();
      }
      if(DataBase.restaurantDatas.elementAt(widget.index).products != null){
        for(int i = 0;i< DataBase.restaurantDatas.elementAt(widget.index).products!.length;i++){
          if(widget.title.toLowerCase() == DataBase.restaurantDatas.elementAt(widget.index).products!.values.elementAt(i).toLowerCase()){
            menuProduct.add(DataBase.restaurantDatas.elementAt(widget.index).products!.keys.elementAt(i));
          }
        }
      }
      else{
        throw Exception("dont have any element");
      }
    }
    catch(error){
      print(error);
    }
  }
}



///hocam şimdi bu değşikliğin olmasını ben provider ile yapıcam!
///degişiklik ise bu menunun bir bugu restaurant pdocuts page classında!!!
///