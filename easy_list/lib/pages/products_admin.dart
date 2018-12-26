import 'package:flutter/material.dart';

class ManageProductPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Product"),
      ),
      body: Center(
        child: Text('Manage your products here!'),
      )
    );
  }
}