import 'package:black_tech_task_2/constants.dart';
import 'package:black_tech_task_2/home/view/activity_view.dart';
import 'package:black_tech_task_2/home/view/dashboard_view.dart';
import 'package:black_tech_task_2/home/view/home_view.dart';
import 'package:black_tech_task_2/home/view/more_view.dart';
import 'package:black_tech_task_2/home/view/order_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const DashboardView(),
    const OrderView(),
    const ActivityView(),
    const MoreView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          unselectedItemColor: Colors.blueGrey,
          items: [
            bottomNavBarItem(Icons.home_outlined, "Home"),
            bottomNavBarItem(Icons.dashboard_outlined, "Dashboard"),
            bottomNavBarItem(Icons.description_outlined, "Order"),
            bottomNavBarItem(Icons.monitor_heart_outlined, "Activity"),
            bottomNavBarItem(Icons.menu, "More"),
          ]),
      body: IndexedStack(index: selectedIndex, children: screens),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
