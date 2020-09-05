import 'package:flutter/material.dart';
import 'package:mrck_store/screens/filter_scree.dart';

class MainDrawer extends StatelessWidget {
  Widget drowerTextTile({IconData icon, String title, Function tapHandler}) {
    return ListTile(
      onTap: tapHandler,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      leading: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.amber,
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          drowerTextTile(
              icon: Icons.restaurant,
              title: 'Meals',
              tapHandler: () {
                Navigator.pushReplacementNamed(context, '/');
              }),
          drowerTextTile(
              icon: Icons.settings,
              title: 'Filter',
              tapHandler: () {
                Navigator.pushReplacementNamed(context, FiltersScreen.classId);
              })
        ],
      ),
    );
  }
}
