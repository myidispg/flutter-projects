import 'package:flutter/material.dart';

import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> _products;
  final Function _addProduct;
  final Function _deleteProduct;

  ProductManager(this._products, this._addProduct, this._deleteProduct);

//  // Method to call when this ProductManager is called for the first time. Subsequent state changes are ignored.
//  @override
//  void initState() {
//    if (widget.startingProduct != null) {
//      _products.add(widget.startingProduct);
//    }
//    super.initState();
//  }

  // Moved below 2 functions to main.dart file.
//  void _addProduct(Map<String, String> product) {
//    // A map is used to hold multiple values. A product can have price, title etc.
//    // Set state is a part of StatefulWidget class. Hence, it cannot be used in StatelessWidget.
//    setState(() {
//      // This method should handle the logic to updating widget's state. This calls the build method again.
//      _products.add(product);
//      print(_products);
//    });
//  }
//
//  void _deleteProduct(int index){
//    setState(() {
//      _products.removeAt(index);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
      Expanded(
          child: Products(_products,
              deleteProduct:
                  _deleteProduct)) // Expanded takes all the available space on viewport.
    ]);
  }
}
