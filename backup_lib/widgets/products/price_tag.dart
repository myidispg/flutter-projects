import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget{
  final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
          '\$ ' + '$price',
          style: TextStyle(color: Colors.white),
        ));
  }
}