import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
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
              leading: Icon(Icons.edit),
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
        // Actions are buttons after title.
        actions: <Widget>[
          IconButton(icon:
          Icon(Icons.favorite),
          onPressed: (){},)
        ],
      ),
//      body: ProductManager(/* startingProduct : 'Food Tester' */ products),
    body: Products(products),
    );
  }
}
