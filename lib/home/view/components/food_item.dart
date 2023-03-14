import 'package:black_tech_task_2/constants.dart';
import 'package:black_tech_task_2/home/model/food_model.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  FoodItem({super.key, required this.foods});

  FoodModel foods;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 120,
        padding: const EdgeInsets.all(10), //decrease the padding to 10 from 15
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: foods.status == "Served"
                    ? dishServedColor
                    : foods.status == "Cancelled"
                        ? primaryColor
                        : Colors.grey.shade300)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Text("${foods.quantity}")),
            ),
            Text(foods.name, style: const TextStyle()),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${foods.price}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 13, //font size decreased
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2), //decrease the padding here also
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: foods.status == "Served"
                          ? dishServedColor.withOpacity(.1)
                          : foods.status == "Cancelled"
                              ? primaryColor.withOpacity(.2)
                              : Theme.of(context).scaffoldBackgroundColor),
                  child: Text(
                    "${foods.status}",
                    style: TextStyle(
                      color: foods.status == "Served"
                          ? dishServedColor
                          : foods.status == "Cancelled"
                              ? primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Positioned(
          top: 0,
          left: 15,
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(36), // Image radius
              child: Image.asset(
                foods.image,
                fit: BoxFit.cover,
              ),
            ),
          )),
    ]);
  }
}
