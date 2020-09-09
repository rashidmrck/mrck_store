import 'package:flutter/material.dart';
import 'package:mrck_store/dummy_data.dart';
import 'package:mrck_store/models/meal.dart';
import 'package:mrck_store/screens/bottom_tabs_screen.dart';
import 'package:mrck_store/screens/category_meals_screen.dart';
import 'package:mrck_store/screens/filter_scree.dart';
import 'package:mrck_store/screens/meal_detail_screen.dart';
import 'screens/catogery_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  Map<String, bool> _filterdata = {
    'Gluteen': false,
    'Vegan': false,
    'Vegetarian': false,
    'Lactose': false,
  };

  void _savefilterData(Map<String, bool> filterdata) {
    setState(() {
      _filterdata = filterdata;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filterdata['Gluteen'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filterdata['Vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filterdata['Vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filterdata['Lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      // initialRoute: CatogeryScreen.classId,
      routes: {
        '/': (context) => BottomTabScreen(),
        CatogeryScreen.classId: (_) => CatogeryScreen(),
        CategoryMeals.classId: (_) => CategoryMeals(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.classId: (_) => MealDetailScreen(),
        FiltersScreen.classId: (_) => FiltersScreen(
            filterdata: _filterdata, saveFilterdata: _savefilterData),
      },
    );
  }
}
