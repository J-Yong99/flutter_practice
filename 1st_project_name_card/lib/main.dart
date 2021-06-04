import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POCKETMON',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('POCKETMON'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ex2.gif'),
                radius: 70.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'PIKACHU',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'POWER LEVEL',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '1',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(width: 10.0),
                Text(
                  'using lightsaber',
                  style: TextStyle(
                      color: Colors.black, fontSize: 16.0, letterSpacing: 1.0),
                )
              ],
            ),
            SizedBox(
              height: 0.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(width: 10.0),
                Text(
                  'face hero tattoo',
                  style: TextStyle(
                      color: Colors.black, fontSize: 16.0, letterSpacing: 1.0),
                )
              ],
            ),
            SizedBox(
              height: 0.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(width: 10.0),
                Text(
                  'fire flame',
                  style: TextStyle(
                      color: Colors.black, fontSize: 16.0, letterSpacing: 1.0),
                )
              ],
            ),
            Center(
                child: CircleAvatar(
              backgroundImage: AssetImage('assets/ex.png'),
              radius: 40.0,
              backgroundColor: Colors.amber[800],
            )),
          ],
        ),
      ),
    );
  }
}
