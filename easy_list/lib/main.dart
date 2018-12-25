import 'package:flutter/material.dart';

import 'product_manager.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Easy List"),
        ),
        body: ProductManager(/* startingProduct : 'Food Tester' */),
      ),
    );
  }
}
