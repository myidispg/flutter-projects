import 'package:flutter/material.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;

  ProductEditPage({this.addProduct, this.updateProduct, this.product});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['title'],
      decoration: InputDecoration(labelText: 'Product Title'),
//      autovalidate: true, // autovalidate shows error even when user has no chance to edit the form. Do validation is by GlobalKey.
      validator: (String value) {
        // This function must not return anything if the validation is correct.
        if (value.isEmpty || value.length < 5)
          return 'Title is required and should be 5+ characters long.';
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      initialValue: widget.product == null ? '' : widget.product['description'],
      decoration: InputDecoration(labelText: 'Product Description'),
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Please enter a desciption and should be 10+ characters long.';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      initialValue: widget.product == null
          ? ''
          : widget.product['price']
              .toString(), // to show an initial value if present.
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number.';
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return; // This makes sure validation occurs on button press.
    }
    _formKey.currentState
        .save(); // the onSaved of all the text fields will be executed now.
    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
              FocusNode()); // For closing the keyboard when text fields are not tapped.
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
              children: <Widget>[
                _buildTitleTextField(),
                _buildDescriptionTextField(),
                _buildPriceTextField(),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text('Save'),
                  textColor: Colors.white,
                  onPressed: _submitForm,
                )
                // GestureDetector(
                //   onTap: _submitForm,
                //   child: Container(
                //     color: Colors.green,
                //     padding: EdgeInsets.all(5.0),
                //     child: Text('My Button'),
                //   ),
                // )
              ],
            ),
          ),
        ));
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(title: Text('Edit product')),
            body: pageContent,
          );
  }
}
