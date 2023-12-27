import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({required this.onToggleFavourite, required this.mealModel, super.key});

  final MealModel mealModel;
  final void Function(MealModel _mealModel) onToggleFavourite;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavourite(mealModel);
              // if(_onFavButtonPressed == true){
              //   setState(() {
              //     _onFavButtonPressed = false;
              //   widget.onToggleFavourite(widget.mealModel);
              //   });
                
              // }
              // else {
              //   setState(() {
              //     _onFavButtonPressed = true;
              //   widget.onToggleFavourite(widget.mealModel);
              //   });
                
              // }
          }, icon:const Icon(Icons.star)), 
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealModel.imageUrl),
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
            for (final ingredient in mealModel.ingredients)
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
            for (final step in mealModel.steps)
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
