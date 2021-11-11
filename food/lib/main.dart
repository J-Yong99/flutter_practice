import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button.dart';
import 'secondpage.dart';

void main() {
  runApp(MyApp());
}

Widget BGActionButton(String text, void Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text("$text"),
    style: ElevatedButton.styleFrom(
      primary: Colors.red, // background
      onPrimary: Colors.white, // foreground
    ),
  );
}

AppBar aa() {
  return AppBar();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var a = true;
  double tmp = 1.0;
  TextEditingController controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      print("yex");
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DefAppBar(
          ctext: "Hello", onlPressed: () {}, onaPressed: () {}, atext: "건너뛰기"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ActionButton(
              text: "Action",
              onPressed: () {
                _incrementCounter();
                {
                  Get.to(SecondPage());
                }
              },
              enabled: true,
              upshadow: false,
              downshadow: false,
            ),
            SmallButton(
                text: "확인",
                onPressed: () {
                  dialog(context);
                }),
            TextBox(controller: controller),
            CheckItem(
              isChecked: a,
              onChanged: on,
            ),
            SizedBox(
              height: 10,
            ),
            DefSlider(
              sliderValue: tmp,
              onChanged: on2,
              max: 10,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void on(bool? c) {}
  void on2(double? c) {}
}
