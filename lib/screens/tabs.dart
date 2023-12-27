import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favourite_meals_provider.dart';
import 'package:meal_app/provider/filters_provider.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/main_drawer.dart';

const Map<Filter, bool> kDefaultFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoriesScreen(
      filteredMeals: availableMeals,
    );
    if (_selectedTab == 1) {
      final favroutieMeals = ref.watch(favouriteMealProvider);
      activeScreen = FavouriteScreen(
        favMeals: favroutieMeals,
      );
    }

    void onSelectScreen(String indentifier) async {
      Navigator.of(context).pop();
      if (indentifier == "filters") {
        await Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _selectedTab == 0
            ? const Text("Categories")
            : const Text("Your Favourties"),
      ),
      drawer: MainDrawer(
        onSelectScreen: onSelectScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (value) => _changeTab(value),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
