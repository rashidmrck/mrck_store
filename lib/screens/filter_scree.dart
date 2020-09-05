import 'package:flutter/material.dart';
import 'package:mrck_store/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const classId = '/FiltersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filers'),
      ),
      body: Center(
        child: Text('FiltersScreen'),
      ),
    );
  }
}
