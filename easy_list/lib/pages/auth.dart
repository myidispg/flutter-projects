import 'package:flutter/material.dart';

import 'products_home.dart';

class AuthPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }

}

class _AuthPageState extends State<AuthPage>{

  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Authenticate'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Email"),
            onChanged: (String value){
              setState(() {
                _emailValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
            onChanged: (String value){
              setState(() {
                _passwordValue = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Accept Terms?'),
            value: _acceptTerms,
            onChanged: (bool value){
              setState(() {
                _acceptTerms = value;
              });
            },
          ),
          SizedBox(height: 10.0,),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  // Push replacement means that once navigated to the next page, the previous page will be removed from stack.
                    context,
                    '/');
              },
              child: Text('Login'),
            ),
          )
        ],
      )
    );
  }
}
