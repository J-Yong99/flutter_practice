import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'page/clothes.dart';
import 'page/food.dart';
import 'page/life.dart';
import 'page/transport.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

enum Inout { In, Out }

class Money {
  bool inorout;
  String? date;
  String? memo;
  String? cost;
  Money(this.date, this.cost, this.memo, {this.inorout = true});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/f': (context) => Food(),
        '/c': (context) => Clothes(),
        '/l': (context) => Life(),
        '/t': (context) => Transport()
      },
      title: 'account book',
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

num clothes = 0;
num food = 0;

num life = 0;
num transport = 0;

class _MainPageState extends State<MainPage> {
  int cost = 0;
  int tmp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          '   J.Y.Kim \n2021-07-04',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.home))
        ],
      ),
      drawer: Drawer(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('Food'),
            trailing: Icon(Icons.navigate_next),
            onTap: () async {
              final res = await Navigator.pushNamed(context, '/f');
              print('$res');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Clothes'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, '/c');
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Life'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, '/l');
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_transit),
            title: Text('Transport'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, '/t');
            },
          )
        ],
      )),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 299.7,
                    width: 205.7,
                    //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
                    color: Colors.grey[600],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Food',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 35.0,
                              width: 150.0,
                              // color: Colors.grey[350],
                              child: TextButton(
                                autofocus: true,
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: Colors.grey[350],
                                  elevation: 0.0,
                                  minimumSize: Size(200, 100),
                                ),
                                onPressed: () {},
                                child: Text('$food',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 100.0,
                              width: 10.0,
                            ),
                            Text(
                              '80%',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 299.7,
                    width: 205.7,
                    //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
                    color: Colors.grey[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Clothes',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 35.0,
                              width: 150.0,
                              // color: Colors.grey[350],
                              child: TextButton(
                                autofocus: true,
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: Colors.grey[350],
                                  elevation: 0.0,
                                  minimumSize: Size(200, 100),
                                ),
                                onPressed: () {},
                                child: Text('$clothes',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 100.0,
                              width: 10.0,
                            ),
                            Text(
                              '80%',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 299.7,
                    width: 205.7,
                    //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
                    color: Colors.grey[400],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Life',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 35.0,
                              width: 150.0,
                              // color: Colors.grey[350],
                              child: TextButton(
                                autofocus: true,
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: Colors.grey[350],
                                  elevation: 0.0,
                                  minimumSize: Size(200, 100),
                                ),
                                onPressed: () {},
                                child: Text('$life',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 100.0,
                              width: 10.0,
                            ),
                            Text(
                              '80%',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 299.7,
                    width: 205.7,
                    //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
                    color: Colors.grey[600],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Transport',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 35.0,
                              width: 150.0,
                              // color: Colors.grey[350],
                              child: TextButton(
                                autofocus: true,
                                style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  backgroundColor: Colors.grey[350],
                                  elevation: 0.0,
                                  minimumSize: Size(200, 100),
                                ),
                                onPressed: () {},
                                child: Text('$transport',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 100.0,
                              width: 10.0,
                            ),
                            Text(
                              '80%',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?>? inputNumber(BuildContext context) async {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Enter cost',
              textAlign: TextAlign.center,
            ),
            content: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Date EX: 08/11'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  autofocus: true,
                  controller: controller2,
                  decoration: InputDecoration(labelText: 'Cost EX : 10000'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  autofocus: true,
                  controller: controller3,
                  decoration: InputDecoration(labelText: 'Memo'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context,
                        {controller.text, controller2.text, controller3.text});
                  },
                  child: Text('done'))
            ],
          );
        }).then((value) {
      setState(() {
        tmp = int.parse(value);
      });
    });
  }
}
