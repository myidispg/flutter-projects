import 'package:flutter/material.dart';

import 'product_card.dart';

/*
We extend Stateless Widget here because the product list is without state.
The actual state change is happening in products_manager.dart file which adds elements to the list.
The updated list is passed here.
So, we can get by with Stateless widget here.
 */
class Products extends StatelessWidget {
  final List<Map<String, dynamic>> _products;

  Products(this._products);

  Widget _buildProduct(BuildContext context, int index) {
    return ProductCard(_products[index], index);
  }

  Widget _buildProductList() {
    Widget productCardList = Center(
        child: Text('Whoops, we do not have a product to display now.'
            'Go add some.'));
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
