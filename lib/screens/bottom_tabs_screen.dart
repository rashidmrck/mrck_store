import 'package:flutter/material.dart';
import 'package:mrck_store/screens/catogery_screen.dart';
import 'package:mrck_store/screens/favorite_screen.dart';
import 'package:mrck_store/widgets/main_drawer.dart';

class BottomTabScreen extends StatefulWidget {
  static const classId = '/BottamTabScreen';
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CatogeryScreen(),
      'title': 'Catogery',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Favorite',
    }
  ];
  int _selectedPageIndex = 0;
  void _selectedItem(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectedItem,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('Category'),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            title: Text('Favorite'),
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
