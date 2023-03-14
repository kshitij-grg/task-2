import 'package:flutter/material.dart';

class OrderedItems extends StatelessWidget {
  OrderedItems({super.key, required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: Colors.grey, fontSize: 11),
    );
  }
}
