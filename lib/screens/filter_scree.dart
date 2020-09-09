import 'package:flutter/material.dart';

import 'package:mrck_store/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const classId = '/FiltersScreen';

  final Map<String, bool> filterdata;
  final Function saveFilterdata;

  FiltersScreen({
    this.filterdata,
    this.saveFilterdata,
  });

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filterdata['Gluteen'];
    _isVegan = widget.filterdata['Vegan'];
    _isVegetarian = widget.filterdata['Vegetarian'];
    _isLactoseFree = widget.filterdata['Lactose'];
    print('done');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilterdata({
                  'Gluteen': _isGlutenFree,
                  'Vegan': _isVegan,
                  'Vegetarian': _isVegetarian,
                  'Lactose': _isLactoseFree,
                });
              })
        ],
        title: Text('Your Filers'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Text(
                'Adjust your meal section.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    value: _isGlutenFree,
                    title: 'Gluten-Free',
                    subTitle: 'Only include gluten-free meals.',
                    onChange: (value) {
                      setState(() {
                        _isGlutenFree = value;
                      });
                    }),
                buildSwitchListTile(
                    value: _isVegan,
                    title: 'Vegan',
                    subTitle: 'Only include vegan meals.',
                    onChange: (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    }),
                buildSwitchListTile(
                    value: _isVegetarian,
                    title: 'Vegetarian',
                    subTitle: 'Only include vegetarian meals.',
                    onChange: (value) {
                      setState(() {
                        _isVegetarian = value;
                      });
                    }),
                buildSwitchListTile(
                    value: _isLactoseFree,
                    title: 'Lactose-Free',
                    subTitle: 'Only include lactose-free meals.',
                    onChange: (value) {
                      setState(() {
                        _isLactoseFree = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitchListTile(
      {bool value, String title, String subTitle, Function onChange}) {
    return SwitchListTile(
      value: value,
      onChanged: onChange,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
