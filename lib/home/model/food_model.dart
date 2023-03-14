class FoodModel {
  FoodModel({
    required this.name,
    required this.price,
    this.status,
    required this.quantity,
    required this.image,
  });

  String name;
  double price;
  String? status;
  int quantity;
  String image;
}
