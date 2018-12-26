import 'package:easy_list/pages/product.dart';
import 'package:easy_list/pages/products_admin.dart';
import 'package:easy_list/pages/products_home.dart';
import 'package:flutter/material.dart';

import 'pages/products_home.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    // A map is used to hold multiple values. A product can have price, title etc.
    // Set state is a part of StatefulWidget class. Hence, it cannot be used in StatelessWidget.
    setState(() {
      // This method should handle the logic to updating widget's state. This calls the build method again.
      _products.add(product);
      print(_products);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

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
        '/': (BuildContext context) => ProductsPage(_products, _addProduct,
            _deleteProduct), // There can either be this '/' or 'home' argument above. Not both.
        'admin': (BuildContext context) => ManageProductPage(),
      },
      // onGenerateRoute is explained in Navigation, Video 17
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') return null;
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
        return null;
      },
      // runs when there is no know route
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products, _addProduct,_deleteProduct));
      },
    );
  }
}
