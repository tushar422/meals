import 'package:flutter/material.dart';
import 'package:meals/data/dummy.dart';
import 'package:meals/model/category.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widget/category_item.dart';

import '../model/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (ctx, index) {
        return CategoryItem(
          item: availableCategories[index],
          onTap: () {
            _selectCategory(ctx, availableCategories[index]);
          },
        );
      },
      itemCount: availableCategories.length,
    );
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredList = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredList,
        ),
      ),
    );
  }
}
