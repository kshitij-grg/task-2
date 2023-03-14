class TableModel {
  String tableName;
  List<OrderedFoods>? orderedFoods;

  TableModel({
    required this.tableName,
    this.orderedFoods,
  });
}

class OrderedFoods {
  String orderedFoodName;
  int orderedFoodQuantity;
  String status;

  OrderedFoods(
      {required this.orderedFoodName,
      required this.orderedFoodQuantity,
      required this.status});
}
