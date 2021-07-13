import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'account book',
      theme: ThemeData(
        backgroundColor: Colors.yellow[100],
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double food = 0.0;
  double clothes = 0.0;
  double life = 0.0;
  double transport = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(
          '   J.Y.Kim \n2021-07-04',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(Colors.grey[600], 'Food', context),
                button(Colors.grey[400], 'Clothes', context)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(Colors.grey[400], 'Life', context),
                button(Colors.grey[600], 'Transport', context)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget button(Color? col, String type, BuildContext context) {
  dynamic? cost;
  return Container(
    height: 330.7,
    width: 205.7,
    //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
    color: col,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$type',
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
            style: TextButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.grey[350],
              elevation: 0.0,
              minimumSize: Size(200, 100),
            ),
            onPressed: () async {
              cost = await inputNumber(context);
            },
            child: Text('$cost',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                )),
          ),
        )
      ],
    ),
  );
}

Future<String>? inputNumber(BuildContext context) {
  TextEditingController controller = TextEditingController();
  showDialog(
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
      });
}
