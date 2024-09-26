import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        SizedBox(
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
