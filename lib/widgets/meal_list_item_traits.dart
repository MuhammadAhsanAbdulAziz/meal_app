import 'package:flutter/material.dart';

class MealListItemTrait extends StatelessWidget {
  const MealListItemTrait({required this.icon,required this.str,super.key});

  final IconData icon;
  final String str;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5,),
          Text(str,style: const TextStyle(color:Colors.white),)
        ],
      ),
    );
  }
}