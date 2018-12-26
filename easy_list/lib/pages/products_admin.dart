import 'package:flutter/material.dart';

import 'products_home.dart';
import 'product_create.dart';
import 'product_list.dart';

class ManageProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: <Widget>[
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: Text('Choose'),
                  ),
                  ListTile(
                    title: Text('All Products'),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProductsPage()));
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text("Manage Product"),
              bottom: TabBar(tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Products',
                )
              ]),
            ),
            body: TabBarView(children: <Widget>[
              // TabBarView is the view for each tab. The amount of pages must be equal to number of tabs.
              // We already have a scaffold as a super widget of this page. No need in sub pages.
              ProductCreatePage(),
              ProductListPage(),
            ])));
  }
}
