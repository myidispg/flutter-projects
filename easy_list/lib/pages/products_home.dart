import 'package:flutter/material.dart';

import 'package:easy_list/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);

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
                Navigator.pushReplacementNamed(
                    context, 'admin'); // added a named route
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Easy List"),
      ),
      body: ProductManager(/* startingProduct : 'Food Tester' */ products,
          addProduct, deleteProduct),
    );
  }
}
