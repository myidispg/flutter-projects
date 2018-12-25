import 'package:flutter/material.dart';

/*
We extend Stateless Widget here because the product list is without state.
The actual state change is happening in products_manager.dart file which adds elements to the list.
The updated list is passed here.
So, we can get by with Stateless widget here.
 */
class Products extends StatelessWidget {
  final List<String> _products;

  Products(this._products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          _products // Below function is to create a list with multiple product cards.
              .map((element) => Card(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/food.jpg'),
                          Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(element))
                        ],
                      ),
                    ),
                  ))
              .toList(),
    );
  }
}
