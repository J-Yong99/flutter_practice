import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Aaa with ChangeNotifier {
  int _a = 0;
  int _b = 1;
  int get aa => _a;
  set aa(int a) {
    _a = a;
    print('$a');
  }

  void add() {
    _a = _a + _b;
    notifyListeners();
  }

  void times() {
    _a = _a * _b;
    notifyListeners();
  }
}

class Bbb with ChangeNotifier {}

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Aaa()),
      ChangeNotifierProvider(create: (_) => Bbb()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Page());
  }
}

class Page extends StatelessWidget {
  Aaa variable1 = Aaa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Provider.of<Aaa>(context).aa.toString()),
          IconButton(
              onPressed: () {
                Provider.of<Aaa>(context, listen: false).add();
              },
              icon: Icon(Icons.ac_unit))
        ],
      )),
    );
  }
}
