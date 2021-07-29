import 'package:flutter/material.dart';
import 'package:my_own_project_accountbook/secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => MainPage(), '/s': (context) => SecondPage()},
      title: 'account book',
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/s');
              },
              icon: Icon(Icons.home))
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('accountName'),
              accountEmail: Text('accountEmail'))
        ],
      )),
      body: Center(
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
