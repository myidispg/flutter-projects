import 'package:flutter/material.dart';

import './pages/product.dart';

/*
We extend Stateless Widget here because the product list is without state.
The actual state change is happening in products_manager.dart file which adds elements to the list.
The updated list is passed here.
So, we can get by with Stateless widget here.
 */
class Products extends StatelessWidget {
  final List<Map<String, String>> _products;
  final Function deleteProduct;

  Products(this._products, {this.deleteProduct});

  Widget _buildProduct(BuildContext context, int index) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
//        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image.asset(_products[index]['image']),
            Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(_products[index]['title'])),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Details'),
                  onPressed: () => Navigator.push<bool>( // bool from product.dart suggests that a the delete button was clicked.
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ProductPage(
                              _products[index]['title'],
                              _products[index]['image']),
                        ),
                      ).then((bool value) { // Then is a function which is executed when the bool value is received.
                        if(value){
                          deleteProduct(index);
                        }
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCardList = Center(
        child: Text('Whoops, we do not have a product to display now.'
            ' Click on the button ^^ to add some.'));
    if (_products.length > 0) {
      productCardList = ListView.builder(
        // A ListView can't be beneath another widget.
        // ^^ Fixed by putting in an expanded widget in product_manager.dart

        itemBuilder: _buildProduct,
        itemCount: _products.length,
      );
    }
    return productCardList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
