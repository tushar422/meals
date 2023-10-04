import 'package:google_fonts/google_fonts.dart';
import 'package:meals/model/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.item,
    required this.onTap,
  });
  final Category item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              item.color.withOpacity(0.3),
              item.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // color: Colors.white,
                // fontSize: 30,
                ),
          ),
        ),
      ),
    );
  }
}
