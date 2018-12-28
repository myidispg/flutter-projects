import 'package:flutter/material.dart';

import 'products_home.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Please Authenticate'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: AssetImage('assets/background.jpg'))),
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.white),
                  onChanged: (String value) {
                    setState(() {
                      _emailValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white),
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      _passwordValue = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Accept Terms?'),
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          // Push replacement means that once navigated to the next page, the previous page will be removed from stack.
                          context,
                          '/products');
                    },
                    child: Text('Login'),
                  ),
                )
              ],
            )))));
  }
}
