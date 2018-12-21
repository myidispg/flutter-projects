import 'package:flutter/material.dart';

import 'category.dart';
import 'package:custom_list/unit.dart';
final _backgroundColor = Colors.green[100];

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {

  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  // Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName){
    return List.generate(10, (int i){
      i += 1;
      return Unit(
      name: '$categoryName Unit $i',
      conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    final categories = <Category> [];

    for(var i = 0; i < _categoryNames.length; i++){
      categories.add(Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: Icons.cake,
          units: _retrieveUnitList(_categoryNames[i])
      ));
    }

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(itemBuilder: (BuildContext context, int index) => categories[index],
        itemCount: categories.length,
      ),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Convertor',
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}

