import 'package:flutter/material.dart';
import 'package:meals/data/dummy.dart';
import 'package:meals/screen/meal_item.dart';
import 'package:meals/widget/meal_item.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onTap: () {
              _openMealItem(ctx, meals[index]);
            }),
        itemCount: meals.length,
      );
    } else {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Nothing to show here!",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              "Try selecting a different category!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      ///title would be null, if the screen is reused for some other purpose.
      //and it has its own appbar

      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }

  _openMealItem(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealItemScreen(
          meal: meal,
        ),
      ),
    );
  }
}
