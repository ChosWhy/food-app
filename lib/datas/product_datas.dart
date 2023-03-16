class RestaurantProduct {
  final String foodName;
  final String explanation;
  final double price;
  final double? discountedPrice;
  final double starPoint;
  final String imageUrl;
  final String productType;

  RestaurantProduct({
    required this.foodName,
    required this.explanation,
    required this.price,
    this.discountedPrice,
    required this.starPoint,
    required this.imageUrl,
    required this.productType,
  });
}
