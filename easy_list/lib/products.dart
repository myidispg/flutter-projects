import 'package:flutter/material.dart';

/*
We extend Stateless Widget here because the product list is without state.
The actual state change is happening in products_manager.dart file which adds elements to the list.
The updated list is passed here.
So, we can get by with Stateless widget here.
 */
class Products extends StatelessWidget {
  final List<String> _products;

  Products([this._products = const []]);

  Widget _buildProduct(BuildContext context, int index) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/food.jpg'),
            Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(_products[index]))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _products.length > 0 ? ListView.builder(
      // A ListView can't be beneath another widget.
      // ^^ Fixed by putting in an expanded widget in product_manager.dart

      itemBuilder: _buildProduct,
      itemCount: _products.length,
    ) : Center(child: Text('Whoops, we do not have a product to display now. Click on the button ^^ to add some.'));
  }
}
