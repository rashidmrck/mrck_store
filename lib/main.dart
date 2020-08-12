import 'package:flutter/material.dart';
import 'package:mrck_store/screens/category_meals_screen.dart';

import 'screens/catogery_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MrCK Store",
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CatogeryScreen(),
      initialRoute: CatogeryScreen.classId,
      routes: {
        CatogeryScreen.classId : (_) => CatogeryScreen(),
        CategoryMeals.classId : (_) => CategoryMeals(),
      },
    );
  }
}
