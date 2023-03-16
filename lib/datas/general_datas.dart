import 'dart:core';

import 'package:food_app/datas/product_datas.dart';

import '../widgets/product_container_impression_widget.dart';

class ProjectDatas {
  static double km = 23;
  static double min = 23;
  static double starPoint = 4.5;
  static double time = 14.31;

  static List<String> toggleForBack = [];
  static List<String> menus = [
    "Preferred",
    "Pasta",
    "Soup",
    "Burger",
    "Pizza",
    "Fish",
  ];

  static Map<String, String> mainPageMenu = {
    "Pasta": "assets/images/pasta_menu.jpg",
    "Soup": "assets/images/soup_menu.jpg",
    "Burger": "assets/images/burger_menu.jpg",
    "Pizza": "assets/images/pizza_menu.jpg",
    "Fish": "assets/images/fish_food_menu.png",
    "Dessert": "assets/images/dessert_menu.png",
  };

  static List<ProductContainerImpressionWidget> mostPreferred = [
    ProductContainerImpressionWidget(
        foodName: "CHICKEN ZINGER",
        explanation: "spky & chpy with geric",
        price: 64.99,
        starPoint: 4.7,
        imageUrl: "assets/images/burger1.png"),
    ProductContainerImpressionWidget(
        foodName: "GRİLLED FİSH",
        explanation: "It's a beautifully grilled fish",
        price: 89.99,
        starPoint: 4.9,
        imageUrl: "assets/images/fish.jpg"),
    ProductContainerImpressionWidget(
        foodName: "MERCİMEK SOUP",
        explanation: "a nice Turkish soup ",
        price: 39.99,
        starPoint: 4.4,
        imageUrl: "assets/images/mercimek_soup.jpg"),
    ProductContainerImpressionWidget(
        foodName: "SAUCE PASTA",
        explanation: "a very delicious sauce pasta with cheese",
        price: 59.99,
        starPoint: 4.6,
        imageUrl: "assets/images/pasta.jpg"),
    ProductContainerImpressionWidget(
        foodName: "PEPPERONİ PİZZA",
        explanation: "with thick cheddar and sauce",
        price: 94.99,
        starPoint: 4.8,
        imageUrl: "assets/images/pepperoni_pizza.jpg"),
  ];

  static Map<RestaurantProduct, String> tempProductsList = {
    RestaurantProduct(
        foodName: "CHICKEN ZINGER",
        explanation: "spky & chpy with geric",
        price: 64.99,
        starPoint: 4.7,
        imageUrl: "assets/images/burger1.png",
        productType: "burger"): "burger",
    RestaurantProduct(
        foodName: "GRİLLED FİSH",
        explanation: "It's a beautifully grilled fish",
        price: 89.99,
        starPoint: 4.9,
        imageUrl: "assets/images/fish.jpg",
        productType: "fish"): "fish",
    RestaurantProduct(
        foodName: "MERCİMEK SOUP",
        explanation: "a nice Turkish soup ",
        price: 39.99,
        starPoint: 4.4,
        imageUrl: "assets/images/mercimek_soup.jpg",
        productType: "soup"): "soup",
    RestaurantProduct(
        foodName: "SAUCE PASTA",
        explanation: "a very delicious sauce pasta with cheese",
        price: 59.99,
        starPoint: starPoint,
        imageUrl: "assets/images/pasta.jpg",
        productType: "pasta"): "pasta",
    RestaurantProduct(
        foodName: "PEPPERONİ PİZZA",
        explanation: "with thick cheddar and sauce",
        price: 94.99,
        starPoint: 4.8,
        imageUrl: "assets/images/pepperoni_pizza.jpg",
        productType: "pizza"): "pizza",
    RestaurantProduct(
        foodName: "PEPPERONİ PİZZA",
        explanation: "with thick cheddar and sauce",
        price: 94.99,
        starPoint: 4.8,
        imageUrl: "assets/images/pepperoni_pizza.jpg",
        productType: "pizza"): "preferred",
  };

}

///senaroyom ürünler için su geçici bir ürün listesi olsun varolan bunu tüm restaurantlar ata
///bu listede işte hemen üstündeki veriler olsun ama bu verileri map olarak al ve string ifade ile de
///hangi tür oldugunu belirle işte burger mi vs cart curt onu belirledikten sonra
///işte tıklandıgında menudeki bir elemana onun ismi neyse anahtar veya degerindeki ifadeyle aynı mı bunu kontrol et aynı olanları
///yeni listeye atasın onu döndürsün ekranda!
