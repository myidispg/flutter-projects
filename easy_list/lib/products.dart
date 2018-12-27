import 'package:flutter/material.dart';

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
    return Card(
      child: Column(children: <Widget>[
        Image.asset(_products[index]['image']),
        Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_products[index]['title'],
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald')),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Text(
                      '\$ ' + '${_products[index]['price'].toString()}',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )),
        DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(4.0)),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                child: Text('Union Square San Francisco'))),
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed<bool>(
                // bool from product.dart suggests that a the delete button was clicked.
                context,
                '/product/' + index.toString()),
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: () => Navigator.pushNamed<bool>(
              // bool from product.dart suggests that a the delete button was clicked.
                context,
                '/product/' + index.toString()),
          )
        ]),
      ]),
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
