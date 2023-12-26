import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({required this.mealModel, super.key});

  final MealModel mealModel;
  

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  var _onFavButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealModel.title),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(_onFavButtonPressed == true){
                _onFavButtonPressed = false;
              }
              else {
                _onFavButtonPressed = true;
              }
            });
          }, icon:_onFavButtonPressed ? const Icon(Icons.star):const Icon(Icons.star_border_outlined)), 
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.mealModel.imageUrl),
            ),
            const SizedBox(height: 15,),
            Text(
              "Ingredients",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 15,),
            for (final ingredient in widget.mealModel.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 15,),
            Text(
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 15,),
            for (final step in widget.mealModel.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
              
          ],
        ),
      ),
    );
  }
}
