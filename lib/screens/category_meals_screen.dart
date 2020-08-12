import 'package:flutter/material.dart';
import 'package:mrck_store/dummy_data.dart';
import 'package:mrck_store/models/meal.dart';

class CategoryMeals extends StatelessWidget {
  static const String classId = '/CatogoryMeals';

  // final String id;
  // final String title;

  // const CategoryMeals({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final Map routArg = ModalRoute.of(context).settings.arguments;

    final categoryId = routArg['id'];
    final categorytitle = routArg['title'];
    final categoryMeals =
        DUMMY_MEALS.where((element) => element.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
