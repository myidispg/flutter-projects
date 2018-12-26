import 'package:flutter/material.dart';

import 'products_home.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Authenticate'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                // Push replacement means that once navigated to the next page, the previous page will be removed from stack.
                context,
                '/');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
