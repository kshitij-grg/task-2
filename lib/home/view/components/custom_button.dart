import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.width,
    required this.labelColor,
    required this.backgroundColor,
    required this.label,
  });

  String label;
  double width;
  Color labelColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: backgroundColor),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: labelColor),
        ),
      ),
    );
  }
}
