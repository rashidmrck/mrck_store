import 'package:flutter/material.dart';

import 'package:mrck_store/models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const String classId = '/CatogoryMeals';

  final List<Meal> availableMeals;
  const CategoryMeals({this.availableMeals});

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String _catogeryTitle;
  List<Meal> displayedMeals;
  var _loadedData = false;

  void _removeItem(value) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == value);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedData) {
      final Map routArg = ModalRoute.of(context).settings.arguments;
      final categoryId = routArg['id'];
      _catogeryTitle = routArg['title'];
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _loadedData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_catogeryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var meal = displayedMeals[index];
          return MealItem(
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
