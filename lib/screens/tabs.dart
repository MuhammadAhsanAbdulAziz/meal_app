import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_dart.dart';
import 'package:meal_app/models/meal_model.dart';
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

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<MealModel> favMeals = [];
  int _selectedTab = 0;
  Map<Filter, bool> _selectedFilter = kDefaultFilters;

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void addFavMeals(MealModel mealModel) {
    if (favMeals.contains(mealModel)) {
      setState(() {
        favMeals.remove(mealModel);
      });
      showMessage("Meal is no longer Favourite");
    } else {
      setState(() {
        favMeals.add(mealModel);
      });
      showMessage("Added to Favourite Meals");
    }
  }

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeal.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      onSelectMeal: addFavMeals,
      filteredMeals: availableMeals,
    );
    if (_selectedTab == 1) {
      activeScreen = FavouriteScreen(
        favMeals: favMeals,
        onFavMealSelect: addFavMeals,
      );
    } else {
      activeScreen = CategoriesScreen(
        onSelectMeal: addFavMeals,
        filteredMeals: availableMeals,
      );
    }

    void onSelectScreen(String indentifier) async {
      Navigator.of(context).pop();
      if (indentifier == "filters") {
        final result = await Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => FilterScreen(activeFilters: _selectedFilter,),
        ));
        print(result);

        setState(() {
          _selectedFilter = result ?? kDefaultFilters;
        });
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
