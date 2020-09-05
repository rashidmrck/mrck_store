import 'package:flutter/material.dart';
import 'package:mrck_store/dummy_data.dart';
import 'package:mrck_store/models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const String classId = '/CatogoryMeals';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String catogeryTitle;
  List<Meal> displayedMeals;

  void _removeItem(value) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == value);
    });
  }

  @override
  void didChangeDependencies() {
    final Map routArg = ModalRoute.of(context).settings.arguments;

    final categoryId = routArg['id'];
    catogeryTitle = routArg['title'];
    displayedMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catogeryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var meal = displayedMeals[index];
          return MealItem(
            removeItem: _removeItem,
            id: meal.id,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            imgUrl: meal.imageUrl,
            title: meal.title,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
