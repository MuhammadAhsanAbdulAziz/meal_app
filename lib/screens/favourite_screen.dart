import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meals_detail_screen.dart';
import 'package:meal_app/widgets/meal_list_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({required this.favMeals, super.key});

  final List<MealModel> favMeals;

  void _selectedMeal(BuildContext context, MealModel mealModel) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetailScreen(mealModel: mealModel),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: favMeals.length,
      itemBuilder: (context, index) {
        return MealListItem(
          mealModel: favMeals[index],
          onSelectMeal: (context, mealModel) {
            
            _selectedMeal(context, mealModel);
          },
        );
      },
    );

    if (favMeals.isEmpty) {
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
              "Try adding a favourite",
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
      body: content,
    );
  }
}
