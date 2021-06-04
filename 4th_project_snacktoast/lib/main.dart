import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'snack bar',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            MySnackBar(),
            Center(
              child: FlatButton(
                onPressed: () {
                  fluttertoast();
                },
                child: Text('toast'),
                color: Colors.blue,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        ));
  }
}

void fluttertoast() {
  Fluttertoast.showToast(
    msg: 'flutter',
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.redAccent,
    fontSize: 120.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          padding: EdgeInsets.all(50.0),
          child: Text('show me'),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'hello',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.teal,
              duration: Duration(milliseconds: 1000),
            ));
          }),
    );
  }
}
