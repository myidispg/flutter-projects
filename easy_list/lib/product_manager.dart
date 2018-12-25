import 'package:flutter/material.dart';

import 'products.dart';

class ProductManager extends StatefulWidget {

  final String startingProduct;

  ProductManager(this.startingProduct);

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
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              // This method should handle the logic to updating widget's state. This calls the build method again.
              _products.add('Advanced Food Tester');
              print(_products);
            });
          },
          child: Text('Add product', style: TextStyle(color: Colors.white),),
        ),
      ),
      Products(_products)
    ]);
  }
}
