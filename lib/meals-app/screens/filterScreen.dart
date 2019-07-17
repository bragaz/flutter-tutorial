import 'package:first_app/meals-app/screens/MainDrawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your filters'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: (){
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };

              widget.saveFilters(selectedFilters);
            },)
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },),
                  _buildSwitchListTile('Vegetarian', 'Only include vegetarian meals', _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },),
                  _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },),
                  _buildSwitchListTile('Lactose-free', 'Only include lactose free meals', _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },),
                ],
              ),
            )
          ],
        ));
  }
}
