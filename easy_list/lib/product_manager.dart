import 'package:flutter/material.dart';

import 'products.dart';
import 'product_control.dart';

class ProductManager extends StatefulWidget {

  final String startingProduct;

  ProductManager({this.startingProduct}); // Default argument.

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  // Method to call when this ProductManager is called for the first time. Subsequent state changes are ignored.
  @override
  void initState() {
    if(widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(String product){
    setState(() {
      // This method should handle the logic to updating widget's state. This calls the build method again.
      _products.add(product);
      print(_products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(_addProduct)
      ),
      Expanded(child: Products(_products)) // Expanded takes all the
    ]);
  }
}
