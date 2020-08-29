import 'package:flutter/material.dart';
import 'package:mrck_store/dummy_data.dart';
import 'package:mrck_store/widgets/grid_card.dart';

class CatogeryScreen extends StatelessWidget {
  static const String classId = '/CatogoryScreen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => GridCard(
                title: e.title,
                color: e.color,
                id: e.id,
              ))
          .toList(),
    );
  }
}
