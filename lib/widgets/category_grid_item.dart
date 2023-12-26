import 'package:flutter/material.dart';
import 'package:meal_app/models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(this.categoryModel, {required this.onSelectCategory,super.key});

  final CategoryModel categoryModel;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              categoryModel.color.withOpacity(0.55),
              categoryModel.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          categoryModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
