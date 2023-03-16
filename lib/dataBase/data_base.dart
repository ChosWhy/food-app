import 'package:food_app/datas/general_datas.dart';
import '../datas/restaurant_datas.dart';

class DataBase{
  static List<RestaurantDatas> restaurantDatas = [
    RestaurantDatas(name: "Pizza Place", starPoint: 4.5, location: "Izmir Turkey", imageUrl: "assets/images/pizza_logo.png",discount: 15,menu: ProjectDatas.menus,mostPreferred: ProjectDatas.mostPreferred,products: ProjectDatas.tempProductsList),
    RestaurantDatas(name: "Pasta Kingdom", starPoint: 4.4, location: "Izmir Turkey", imageUrl: "assets/images/pasta_logo.png",menu: ProjectDatas.menus,mostPreferred: ProjectDatas.mostPreferred,products: ProjectDatas.tempProductsList),
    RestaurantDatas(name: "Fire seasoning ", starPoint: 4.1, location: "Izmir Turkey", imageUrl: "assets/images/soup_logo.png",discount: 10,menu: ProjectDatas.menus,mostPreferred: ProjectDatas.mostPreferred,products: ProjectDatas.tempProductsList),
    RestaurantDatas(name: "Burger King", starPoint: 4.8, location: "Izmir Turkey", imageUrl: "assets/images/burger_logo.png",menu: ProjectDatas.menus,mostPreferred: ProjectDatas.mostPreferred,products: ProjectDatas.tempProductsList),
    RestaurantDatas(name: "Fish Paradise", starPoint: 4.5, location: "Izmir Turkey", imageUrl: "assets/images/fish_food_menu.png",discount: 25,menu: ProjectDatas.menus,mostPreferred: ProjectDatas.mostPreferred,products: ProjectDatas.tempProductsList),
    RestaurantDatas(name: "Crazy of Dessert", starPoint: 4.9, location: "Izmir Turkey", imageUrl: "assets/images/dessert_logo.jpg",menu: ProjectDatas.menus,mostPreferred: ProjectDatas.mostPreferred,products: ProjectDatas.tempProductsList),
  ];

  static List<bool> menuDatasController = [
    false,
    false,
    false,
    false,
    false,
    false
  ];

}


///şimdi yeni bir restaurant eklendiginde DataBase classının içindeki restaurantDatas a eklensin
///bu restaurant verileri okey ekleniyor ama eklenirken menulerini girebiliyor okey menuler ayarlanabiliyor okey
///ama menu eklenicegi zaman restaurant_datasdan database deki listeye gelmesini nasıl saglarım?
///
/// şimdi hoca menuleri atadım ama şimdi ise menulerin productları ve bu productlar restaurantlara özel olmalı!
///