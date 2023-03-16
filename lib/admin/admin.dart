import 'package:food_app/dataBase/data_base.dart';
import 'package:food_app/datas/general_datas.dart';
import 'package:food_app/datas/restaurant_datas.dart';

import '../datas/product_datas.dart';
import '../widgets/product_container_impression_widget.dart';

class Admin {
  final int index;

  Admin({required this.index});

  void createNewRestaurant(
      {required String name,
      required String location,
      required String imageUrl,
      required,
      required double starPoint,
      double? discount,
      required List<String> menu}) {
    DataBase.restaurantDatas.add(RestaurantDatas(
      name: name,
      starPoint: starPoint,
      location: location,
      imageUrl: imageUrl,
      menu: menu,
      discount: discount,
      mostPreferred: [],
    ));
    DataBase.menuDatasController.add(false);
  }

  void addToMostPreferredItems(ProductContainerImpressionWidget product) {
    try {
      if (ProjectDatas.mostPreferred.length >= 0 &&
          ProjectDatas.mostPreferred.length <= 5) {
        ProjectDatas.mostPreferred.add(product);
      } else {
        throw Exception(
            "Eleman sayısı hatası! max 5 min 0 eleman olmalı tercih edilenler.");
      }
    } catch (error) {
      print(error);
    }
  }

  void removeFromMostPreferredItems({required String preferredItemsName}) {
    bool exceptionController = false;
    try {
      for (int i = 0; i < ProjectDatas.mostPreferred.length; i++) {
        if (ProjectDatas.mostPreferred.elementAt(i).foodName ==
            preferredItemsName) {
          ProjectDatas.mostPreferred.remove(ProjectDatas.mostPreferred[i]);
        } else {
          exceptionController = true;
        }
      }
      if (exceptionController) {
        throw Exception(
            "Böyle bir productName yoktur. / there is not this productName");
      }
    } catch (error) {
      print(error);
    }
  }

  List<String> get menuItems => DataBase.restaurantDatas.elementAt(index).menu;

  void addToMenuItems({required String menuItems}) {
    DataBase.restaurantDatas.elementAt(index).menu.add(menuItems);
  }

  void removeFromMenuItems({required String menuItems}) {
    DataBase.restaurantDatas.elementAt(index).menu.remove(menuItems);
  }

  void addProduct(
      {required RestaurantProduct product, required String productType}) {
    DataBase.restaurantDatas.elementAt(index).products!.addAll({product,productType} as Map<RestaurantProduct, String>);
  }

  ///senaryom su o indexdeki elemanın bilgisini bilmiyorsa remove ederken önce get ederek alsın bilgiler
  ///sonra o bilgilerle silme işlemi yapsın sonra finito
  RestaurantProduct? getProduct({required String productName}) {
    bool exceptionController = false;
    try {
      if (DataBase.restaurantDatas.elementAt(index).products != null) {
        for (int i = 0;
            i < DataBase.restaurantDatas.elementAt(index).products!.length;
            i++) {
          if (DataBase.restaurantDatas
                  .elementAt(index)
                  .products!.keys
                  .elementAt(i)
                  .foodName ==
              productName) {
            exceptionController = false;
            return DataBase.restaurantDatas
                .elementAt(index)
                .products!.keys
                .elementAt(i);
          } else {
            exceptionController = true;
          }
        }
        if (exceptionController) {
          throw Exception(
              "Böyle bir productName yoktur. / there is not this productName");
        }
      } else {
        throw Exception("Products is empty,so i cant remove processes");
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  void removeProduct({required String productName}) {
    bool exceptionController = false;
    try {
      if (DataBase.restaurantDatas.elementAt(index).products != null) {
        for (int i = 0;
            i < DataBase.restaurantDatas.elementAt(index).products!.length;
            i++) {
          if (DataBase.restaurantDatas
                  .elementAt(index)
                  .products!.keys
                  .elementAt(i)
                  .foodName ==
              productName) {
            DataBase.restaurantDatas
                .elementAt(index)
                .products!
                .remove(DataBase.restaurantDatas.elementAt(index).products![i]);
            exceptionController = false;
          } else {
            exceptionController = true;
          }
        }
        if (exceptionController) {
          throw Exception(
              "Böyle bir productName yoktur. / there is not this productName");
        }
      }
    } catch (error) {
      print(error);
    }
  }
}

///adminden restauran olustrabilicem,restaurant olusuruyosam burdan menusunu isteyebilirim
///yine product listesini isteyebilirim
///admin varsa restaurant sahibi olabilir onun içinde procutları değiştirme menulerı degiştirme
