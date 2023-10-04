import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/data/dummy.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
