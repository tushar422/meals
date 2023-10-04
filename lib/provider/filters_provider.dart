import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy.dart';
import '../model/meal.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegeterian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool value) {
    // state[filter] = value;
    state = {...state, filter: value};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final selectedFilters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
    if (selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) return false;
    if (selectedFilters[Filter.lactosefree]! && !meal.isLactoseFree)
      return false;
    if (selectedFilters[Filter.vegeterian]! && !meal.isVegetarian) return false;
    if (selectedFilters[Filter.vegan]! && !meal.isVegan) return false;

    return true;
  }).toList();
});
