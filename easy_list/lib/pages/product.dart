import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(// added in Section Navigation,c Video 8
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(this.imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Details!'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'DELETE!',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.pop(context,
                    true), // true is an indicator that page is to be deleted.
                // ^^ This true is used in MaterialPageRoute in products.dart
              ),
            ),
          ],
        ),
      ),
    );
  }
}
