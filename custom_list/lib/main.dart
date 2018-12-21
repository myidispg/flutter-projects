import 'package:flutter/material.dart';

import 'package:custom_list/category.dart';

const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

void main() => runApp(UnitConvertorApp());

class UnitConvertorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Convertor',
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: Category(name: _categoryName, color: _categoryColor, iconLocation: _categoryIcon),
        ),
      ),
    );
  }

}

