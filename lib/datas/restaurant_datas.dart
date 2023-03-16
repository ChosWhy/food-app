import 'package:food_app/datas/product_datas.dart';
import '../widgets/product_container_impression_widget.dart';

class RestaurantDatas {
  String imageUrl;
  String name;
  String location;
  double starPoint;
  double? discount;
  List<String> menu = [];
  List<ProductContainerImpressionWidget> mostPreferred = [];

  Map<RestaurantProduct,String>? products = {};

  RestaurantDatas(
      {required this.name,
        required this.starPoint,
        required this.location,
        required this.imageUrl,
        this.discount,required this.menu,required this.mostPreferred,this.products});
}