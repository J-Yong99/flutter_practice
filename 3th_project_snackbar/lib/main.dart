import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'snack bar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Snack Bar')),
        body: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: FlatButton(
                child: Text(
                  'show me',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  Scaffold.of(ctx).showSnackBar(SnackBar(
                    content: Text('hello'),
                  ));
                },
              ),
            );
          },
        ));
  }
}
