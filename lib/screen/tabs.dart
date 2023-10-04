import 'package:flutter/material.dart';
import 'package:meals/data/dummy.dart';
import 'package:meals/provider/favourites_provider.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/filters.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';
import '../model/meal.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  String activePageTitle = "Categories";
  late Widget activePage;

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    switch (_selectedPageIndex) {
      case 0:
        activePage = CategoriesScreen(
          availableMeals: availableMeals,
        );
        activePageTitle = "Categories";
        break;
      case 1:
        final favMeals = ref.watch(favouriteMealsProvider);
        activePage = MealsScreen(
          meals: favMeals,
        ); //favourites screen. // Reusing MealsScreen.
        activePageTitle = "Favourites";
        break;

      default:
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setDrawerScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }

  void _setDrawerScreen(String id) async {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
