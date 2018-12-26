import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'title': 'Chocolate', 'image': 'assets/food.jpg'});
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("Added a new product")));
      },
      child: Text(
        'Add product',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
