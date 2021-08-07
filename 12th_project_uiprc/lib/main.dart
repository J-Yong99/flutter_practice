import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'chapter7',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var _index = 0;
  var _pages = [Page1(), Page2(), Page3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('복잡한 UI', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (ind) {
            setState(() {
              _index = ind;
              print('$_index');
            });
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: 'service'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'information'),
          ]),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [top(), middle(), bottom()],
    );
  }
}

Widget top() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10.0,
          ),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('택시'),
          SizedBox(height: 10.0),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('택시'),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10.0,
          ),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('블랙'),
          SizedBox(height: 10.0),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('블랙'),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10.0,
          ),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('바이크'),
          SizedBox(height: 10.0),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('바이크'),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10.0,
          ),
          IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(Icons.local_taxi),
              iconSize: 40.0),
          Text('대리'),
          SizedBox(height: 78.0),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    ],
  );
}

Widget middle() {
  return CarouselSlider(
    options: CarouselOptions(height: 200.0),
    items: [
      1, 2, 3
      // Image.asset('olymic.running.png'),
      // Image.asset('olymic.running.png'),
      // Image.asset('olymic.running.png'),
    ]
        .map((i) => Builder(builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Text('$i'));
            }))
        .toList(),
  );
}

Widget bottom() {
  final items = List.generate(
      10,
      (index) => ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('$index memo'),
          ));
  return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: items,
  );
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
      onPressed: () {},
      child: Text('1page'),
    ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('3page'),
    );
  }
}
