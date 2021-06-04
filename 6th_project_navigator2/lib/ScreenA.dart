import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ScreenA', style: TextStyle(color: Colors.black45)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                color: Colors.redAccent,
                child: Text('go to the ScreenB'),
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                }),
            RaisedButton(
                color: Colors.redAccent,
                child: Text('go to the ScreenC'),
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                })
          ],
        ),
      ),
    );
  }
}
