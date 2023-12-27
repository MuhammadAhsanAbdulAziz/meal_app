import 'package:meal_app/data/dummy_dart.dart';
import 'package:riverpod/riverpod.dart';

final mealsProvider = Provider((ref){
  return dummyMeal;
});