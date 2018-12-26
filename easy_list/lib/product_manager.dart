import 'package:flutter/material.dart';

import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager(
      {this.startingProduct} /* {this.startingProduct = 'Some food'} */); // Default argument.

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  // Method to call when this ProductManager is called for the first time. Subsequent state changes are ignored.
  @override
  void initState() {
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(Map<String, String> product) {
    // A map is used to hold multiple values. A product can have price, title etc.
    // Set state is a part of StatefulWidget class. Hence, it cannot be used in StatelessWidget.
    setState(() {
      // This method should handle the logic to updating widget's state. This calls the build method again.
      _products.add(product);
      print(_products);
    });
  }

  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
      Expanded(
          child: Products(
              _products, deleteProduct: _deleteProduct)) // Expanded takes all the available space on viewport.
    ]);
  }
}
