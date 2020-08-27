import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const classId = '/mealDetailScreen';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
