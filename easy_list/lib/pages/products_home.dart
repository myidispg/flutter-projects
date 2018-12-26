import 'package:flutter/material.dart';

import 'package:easy_list/product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(title: Text('Choose a page.'),),
            ListTile(),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Easy List"),
      ),
      body: ProductManager(/* startingProduct : 'Food Tester' */),
    );
  }
}
