import 'package:flutter/material.dart';

class OrderedTable extends StatelessWidget {
  OrderedTable({
    super.key,
    required this.label,
    required this.color,
  });
  String label;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 11, color: color),
    );
  }
}
