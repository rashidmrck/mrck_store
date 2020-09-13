import 'package:flutter/material.dart';

import 'package:mrck_store/models/meal.dart';
import 'package:mrck_store/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorateMeals;

  const FavoriteScreen({this.favorateMeals});

  @override
  Widget build(BuildContext context) {
    if (favorateMeals.isEmpty) {
      return Center(
        child: Text('Yoy have no favorite yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var meal = favorateMeals[index];
          return MealItem(
            id: meal.id,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            imgUrl: meal.imageUrl,
            title: meal.title,
          );
        },
        itemCount: favorateMeals.length,
      );
    }
  }
}
