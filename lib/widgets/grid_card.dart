import 'package:flutter/material.dart';
import 'package:mrck_store/screens/category_meals_screen.dart';

class GridCard extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const GridCard({this.title, this.color, this.id});

  void mealsScreen(BuildContext cont) {
    Navigator.of(cont).pushNamed(CategoryMeals.classId, arguments: {
      'title': title,
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => mealsScreen(context),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
