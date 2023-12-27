import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal_model.dart';

class FavouriteMealsNotifier extends StateNotifier<List<MealModel>>{
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(MealModel mealModel){
    final mealIsFavourite = state.contains(mealModel);
    if(mealIsFavourite){
      state = state.where((meal) => meal.id != mealModel.id).toList();
      return false;
    }
    else{
      state = [...state,mealModel];
      return true;
    }
  }
}

final favouriteMealProvider = StateNotifierProvider<FavouriteMealsNotifier,List<MealModel>>((ref) {
  return FavouriteMealsNotifier();
},);