import 'package:flutter/material.dart';

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.greenAccent,
        height: 400,
        width: 300,
        child: Center(
            child: Text(
          'Hello!',
          style: TextStyle(fontSize: 40.0),
        )),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner:
          false, // To remove the debug banner on top right
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Rectangle!'),
          backgroundColor: new Color(0xFF673AB7), // Change app bar color
        ),
        body: HelloRectangle(),
      ),
    ),
  );
}
