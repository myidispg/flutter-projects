import 'package:flutter/material.dart';

import 'package:easy_list/product_manager.dart';
import 'products_admin.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading:
                  false, // Disable hamburger icon in Drawer.
              title: Text('Choose a page.'),
            ),
            ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ManageProductPage()));
              },
            ),
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
