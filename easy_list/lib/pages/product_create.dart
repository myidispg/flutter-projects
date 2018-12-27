import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
        child: ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: 'Product Title',
              hintText: 'Enter product title here.'),
          onChanged: (String value) {
            setState(() {
              titleValue = value;
            });
          },
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
              labelText: 'Product Description',
              hintText: 'Enter product description here.'),
          onChanged: (String value) {
            setState(() {
              descriptionValue = value;
            });
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Product Price',
              hintText: 'Enter product price here.'),
          onChanged: (String value) {
            setState(() {
              priceValue = double.parse(value);
            });
          },
        ),
        RaisedButton(
          child: Text('Save Product'),
          onPressed: ,
        )
      ],
    ));
  }
}
