import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

var a = RxInt(0);
var b = RxInt(0);
void increment(RxInt tmp) => tmp.value++;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'getx ex',
      home: HomePage(),
      getPages: [
        GetPage(
          name: '/2',
          page: () => SecondPage(),
        ),
        GetPage(
          name: '/1',
          page: () => HomePage(),
        )
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${b.value}'),
          ElevatedButton(
              onPressed: () {
                increment(a);
                Get.toNamed(
                  '/2',
                );
              },
              child: Text('go to next page')),
        ]),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('${a.value}'),
            ElevatedButton(
                onPressed: () {
                  increment(b);
                  Get.toNamed(
                    '/1',
                  );
                },
                child: Text('2ndpage'))
          ]),
        ),
      ),
    );
  }
}
