import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_dart.dart';
import 'package:meal_app/models/category_model.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.filteredMeals,super.key});

    final List<MealModel> filteredMeals; 

  void _selectedCategory(BuildContext context, CategoryModel categoryModel) {
    final filteredList = filteredMeals
        .where((meal) => meal.categories.contains(categoryModel.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(meals: filteredList, title: categoryModel.title),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          return CategoryGridItem(
            availableCategories[index],
            onSelectCategory: () => _selectedCategory(context,availableCategories[index]),
          );
        },
      ),
    );
  }
}
