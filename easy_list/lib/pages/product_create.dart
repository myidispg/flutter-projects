import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

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
                  _titleValue = value;
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
                  _descriptionValue = value;
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
                  _priceValue = double.parse(value);
                });
              },
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Save Product'),
              textColor: Colors.white,
              onPressed: () {
                final Map<String, dynamic> product = {
                  'title': _titleValue,
                  'description': _descriptionValue,
                  'price': _priceValue,
                  'image': 'assets/food.jpg'
                };
                widget.addProduct(product);
                Navigator.pushReplacementNamed(context, '/products');
              },
            )
          ],
        ));
  }
}
