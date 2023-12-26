import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meals_detail_screen.dart';
import 'package:meal_app/widgets/meal_list_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({required this.meals, required this.title, super.key});

  void _selectedMeal(BuildContext context, MealModel mealModel) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetailScreen(mealModel: mealModel),
    ));
  }

  final List<MealModel> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealListItem(mealModel: meals[index],onSelectMeal:(context, mealModel) {
          _selectedMeal(context,mealModel);
        },);
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "uh uh Nothing here...",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Try selecting a new category",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        // leading:
        //     IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: Text(title),
      ),
      body: content,
    );
  }
}
