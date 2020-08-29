import 'package:flutter/material.dart';
import 'package:mrck_store/screens/catogery_screen.dart';
import 'package:mrck_store/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MrCK Store'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CatogeryScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
