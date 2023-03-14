import 'package:black_tech_task_2/constants.dart';
import 'package:black_tech_task_2/home/model/table_model.dart';
import 'package:black_tech_task_2/home/view/components/ordered_items.dart';
import 'package:black_tech_task_2/home/view/components/ordered_table.dart';
import 'package:black_tech_task_2/home/view/single_order_view.dart';
import 'package:flutter/material.dart';

class OrderTab extends StatelessWidget {
  OrderTab({super.key});

  double screenWidth = 0;
  double screenHeight = 0;

  List<TableModel> foodList = [
    TableModel(
      tableName: "First Floor T4",
    ),
    TableModel(
      tableName: "Roof T2",
    ),
    TableModel(
      tableName: "Balcony Table",
    ),
    TableModel(
      tableName: "Table 31",
    ),
    TableModel(
      tableName: "Mike Torello",
    ),
    TableModel(
      tableName: "Angus MacGyver",
    ),
    TableModel(
      tableName: "Table 07",
    ),
    TableModel(
      tableName: "Table 05",
    ),
    TableModel(
      tableName: "Table 09",
    ),
    TableModel(
      tableName: "Table 01",
    ),
    TableModel(
      tableName: "Rick Wright",
    ),
  ];

  List<OrderedFoods> orderedFoodItems = [
    OrderedFoods(
        orderedFoodName: "Mid Steak",
        orderedFoodQuantity: 03,
        status: "Served"),
    OrderedFoods(
        orderedFoodName: "Taco", orderedFoodQuantity: 01, status: "Pending"),
    OrderedFoods(
        orderedFoodName: "Chi. Burger",
        orderedFoodQuantity: 05,
        status: "Cancelled"),
    OrderedFoods(
        orderedFoodName: "Wine", orderedFoodQuantity: 01, status: "Pending"),
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        itemCount: foodList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            mainAxisExtent: screenHeight * .2),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.add), Text("Add order")],
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SingleOrderVeiw()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodList[index].tableName,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: screenHeight * .175,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  padding: EdgeInsets.all(screenWidth / 50),
                  child: Column(
                    children: [
                      orderedTableInfo(),
                      const SizedBox(
                        height: 5,
                      ),
                      ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 80.0,
                          ),
                          child: orderedItemsInfo()),
                      const Spacer(),
                      orderedItemsSummary(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ListView orderedItemsInfo() {
    return ListView.builder(
      itemCount: orderedFoodItems.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) => Row(
        children: [
          Icon(
            Icons.circle,
            size: 6,
            color: orderedFoodItems[index].status == "Served"
                ? dishServedColor
                : orderedFoodItems[index].status == "Cancelled"
                    ? primaryColor
                    : dishPendingColor,
          ),
          const SizedBox(
            width: 5,
          ),
          OrderedItems(label: orderedFoodItems[index].orderedFoodName),
          const Spacer(),
          OrderedItems(label: "${orderedFoodItems[index].orderedFoodQuantity}"),
        ],
      ),
    );
  }

  Row orderedTableInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderedTable(
          label: "Table",
          color: Colors.black,
        ),
        OrderedTable(
          label: "1:45 PM",
          color: dishServedColor,
        ),
      ],
    );
  }

  Column orderedItemsSummary() {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OrderedTable(label: "Dishes: 13", color: Colors.black54),
            OrderedTable(label: "KOT: 3", color: Colors.black54),
          ],
        ),
      ],
    );
  }
}
