import 'package:flutter/material.dart';

import 'page/clothes.dart';
import 'page/food.dart';
import 'page/life.dart';
import 'page/transport.dart';

void main() {
  runApp(MyApp());
}

class Person {
  String? name;
  Person(name);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class _MainPageState extends State<MainPage> {
  int cost = 0;
  int tmp = 0;
  int food = 0;
  int clothes = 0;
  int life = 0;
  int transport = 0;
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() async {
                                    await inputNumber(context);
                                    food += tmp;
                                  });
                                },
                                icon: Icon(Icons.add),
                                iconSize: 60.0,
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() async {
                                    await inputNumber(context);
                                    food -= tmp;
                                  });
                                },
                                icon: Icon(Icons.remove),
                                iconSize: 60.0,
                                color: Colors.black,
                              )
                            ])
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
                            onPressed: () {
                              setState(() async {
                                await inputNumber(context);

                                life = tmp;
                              });
                            },
                            child: Text('$life',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                )),
                          ),
                        )
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
                            onPressed: () {
                              setState(() async {
                                await inputNumber(context);

                                transport = tmp;
                              });
                            },
                            child: Text('$transport',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                )),
                          ),
                        )
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
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Enter cost',
              textAlign: TextAlign.center,
            ),
            content: TextField(
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(labelText: 'EX : 10000'),
              keyboardType: TextInputType.number,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, controller.text);
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

  void loading() {}
  // Widget button(Color? col, String type, BuildContext context, int cost) {
  //   return Container(
  //     height: 330.7,
  //     width: 205.7,
  //     //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
  //     color: col,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Text(
  //           '$type',
  //           style: TextStyle(
  //             fontSize: 30,
  //             color: Colors.black,
  //           ),
  //         ),
  //         Container(
  //           height: 35.0,
  //           width: 150.0,
  //           // color: Colors.grey[350],
  //           child: TextButton(
  //             style: TextButton.styleFrom(
  //               primary: Colors.black,
  //               backgroundColor: Colors.grey[350],
  //               elevation: 0.0,
  //               minimumSize: Size(200, 100),
  //             ),
  //             child: Text('$cost',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   color: Colors.black54,
  //                   fontSize: 20,
  //                 )),
  //             onPressed: () {
  //               setState(() async {
  //                 await inputNumber(context);

  //                 cost = tmp;
  //                 print('assasa $cost');
  //               });
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
