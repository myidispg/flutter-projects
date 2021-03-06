import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('THis action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('DELETE'),
                onPressed: () {
                  Navigator.pop(context); // close the dialog.
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pop(context, true); // Delete the item.
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // added in Section Navigation, Video 8
      // WillPopScope blocks the back button. Now, to make sure the back buttons work, use Navigator.pop().
      // This also allows us to pass the future bool value.
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false); // true means allowed to leave.
        // A false will also work in this case because we have the navigator. But, without the navigator, back buttons won't work.
      },
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
                onPressed: () {
                  _showWarningDialog(context);
                }, // true is an indicator that page is to be deleted.
                // ^^ This true is used in MaterialPageRoute in products.dart
              ),
            ),
          ],
        ),
      ),
    );
  }
}
