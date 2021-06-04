import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'navigator',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Container(
        width: 250.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                  child: Text('push'),
                  onPressed: () {
                    Navigator.push(context2,
                        MaterialPageRoute(builder: (context2) => SecondPage()));
                  }),
              RaisedButton(
                  child: Text('pop'),
                  onPressed: () {
                    Navigator.pop(context2);
                  })
            ]),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Container(
        width: 250,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text('push'),
                onPressed: () {
                  Navigator.push(ctx,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
              ),
              RaisedButton(
                  child: Text('pop'),
                  onPressed: () {
                    Navigator.pop(ctx);
                  })
            ]),
      ),
    );
  }
}
