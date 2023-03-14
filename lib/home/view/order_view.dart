import 'package:black_tech_task_2/constants.dart';
import 'package:black_tech_task_2/home/view/components/order_tab.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

const List<String> list = <String>['The Grill', 'Two', 'Three', 'Four'];

class _OrderViewState extends State<OrderView> {
  String dropdownValue = list.first;
  double screenwidth = 0;

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: screenwidth / 20),
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Poppins Regular'),
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                text: "Order",
              ),
              Tab(
                text: "KOT",
              ),
            ],
          ),
          title: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            underline: Container(),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenwidth / 20),
          child: TabBarView(
            children: [
              OrderTab(),
              const Icon(Icons.directions_transit),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Icon(
            Icons.dashboard_customize,
            color: primaryColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
