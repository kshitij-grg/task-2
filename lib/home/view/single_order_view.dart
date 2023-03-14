import 'package:black_tech_task_2/constants.dart';
import 'package:black_tech_task_2/home/model/food_model.dart';
import 'package:black_tech_task_2/home/view/components/custom_button.dart';
import 'package:black_tech_task_2/home/view/components/food_item.dart';
import 'package:flutter/material.dart';

class SingleOrderVeiw extends StatelessWidget {
  SingleOrderVeiw({super.key});
  double screenWidth = 0;
  double screenHeight = 0;

  List<FoodModel> foodList = [
    FoodModel(
        name: "Burger",
        price: 280,
        status: "",
        quantity: 3,
        image: "assets/images/burger.png"),
    FoodModel(
        name: "Chicken Mix",
        price: 500,
        status: "",
        quantity: 2,
        image: "assets/images/chicken-mix.png"),
    FoodModel(
        name: "Mushroom Pizza",
        price: 480,
        status: "Served",
        quantity: 1,
        image: "assets/images/mushroom-pizza.png"),
    FoodModel(
        name: "Chicken Chilly",
        price: 360,
        status: "Cancelled",
        quantity: 2,
        image: "assets/images/chicken-mix.png"),
    FoodModel(
        name: "Salad Medium",
        price: 160,
        status: "Cancelled",
        quantity: 3,
        image: "assets/images/salad.png"),
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Table 05",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Poppins Regular'),
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                text: "Dishes",
              ),
              Tab(
                text: "KOT",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
          child: TabBarView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: screenHeight / 40,
                ),
                const Text(
                  "KOT #205",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: foodList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 150),
                    itemBuilder: (context, index) =>
                        FoodItem(foods: foodList[index]),
                  ),
                ),
                lowerBody(),
              ]),
              const Icon(Icons.directions_transit),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: screenHeight / 8),
          child: FloatingActionButton.small(
            onPressed: () {},
            backgroundColor: primaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }

  lowerBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("KOT #204"),
        SizedBox(
          height: screenHeight * .01,
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Total"),
            Text("1420"),
          ],
        ),
        SizedBox(
          height: screenHeight * .015,
        ),
        Row(
          children: [
            CustomButton(
                label: 'Add',
                width: screenWidth / 4,
                backgroundColor: Colors.grey.shade300,
                labelColor: Colors.black),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            CustomButton(
                label: 'Checkout',
                width: screenWidth / 1.65,
                backgroundColor: primaryColor,
                labelColor: Colors.white),
          ],
        ),
        SizedBox(
          height: screenHeight * .025,
        ),
      ],
    );
  }
}
