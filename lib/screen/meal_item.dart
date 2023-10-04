import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/provider/favourites_provider.dart';

class MealItemScreen extends ConsumerWidget {
  MealItemScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  bool isFavourite = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isFavourite = ref.watch(favouriteMealsProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .watch(favouriteMealsProvider.notifier)
                  .toggleMealFavouriteStatus(meal);
            },
            icon: (isFavourite)
                ? const Icon(Icons.favorite_sharp)
                : const Icon(Icons.favorite_border_sharp),
          )
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 350,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ...meal.ingredients.map(
            (e) => Text(
              e,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ...meal.steps.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 8,
              ),
              child: Text(
                '> $e',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
