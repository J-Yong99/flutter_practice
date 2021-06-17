import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('you have pushed the button this many times:'),
              Text('$counter', style: Theme.of(context).textTheme.display1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          counter++;
                          // print("$counter");
                        });
                      }),
                  FloatingActionButton(
                      child: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          counter--;
                          // print("$counter");
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
