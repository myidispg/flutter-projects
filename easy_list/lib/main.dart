import 'package:easy_list/pages/products_admin.dart';
import 'package:easy_list/pages/products_home.dart';
import 'package:flutter/material.dart';

import 'pages/auth.dart';

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
//      home: AuthPage(),
      routes: {
        '/': (BuildContext context) =>
            ProductsPage(), // There can either be this '/' or 'home' argument above. Not both.
        'admin': (BuildContext context) => ManageProductPage(),
      },
    );
  }
}
