import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          //actions = place widget right, leading = place widget left
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor: Colors.black,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/ex.png'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/turtle.jpg'),
                )
              ],
              accountName: Text('pikachu'),
              accountEmail: Text('alexj99@naver.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text(
                'home',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                print('home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text(
                'setting',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                print('setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text(
                'Q&A',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ), //scaffold.drawer automatically make left menu button
    );
  }
}
