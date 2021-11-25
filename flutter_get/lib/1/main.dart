import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class Click extends GetxController {
  var count = 0;
  void increment() {
    this.count++;
    update();
  }
}

class Click2 extends GetxController {
  var count1 = 0.obs;
  get count2 => count1 * 2;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(count1, (_) {
      print('EVER worker working');
    });
  }
}

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
    final firstPageClick = Get.put(Click());
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GetBuilder<Click>(
              builder: (_) => Text('${firstPageClick.count}times')),
          ElevatedButton(
              onPressed: () async {
                var a = await Get.defaultDialog(
                    middleText: 'sure?',
                    content: TextButton(
                        onPressed: () {
                          Get.find<Click>().increment();
                          firstPageClick.increment();
                          Get.back<bool>(result: true);
                        },
                        child: Text('yes')));
                Get.snackbar(
                  'title',
                  'go to next page',
                  backgroundColor: Colors.amber,
                );
                await Future.delayed(Duration(seconds: 2));

                if (a) {
                  Get.toNamed(
                    '/2',
                  );
                }
              },
              child: Text('go to next page')),
        ]),
      ),
    );
  }
}

// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final secondPageClick = Get.put(Click2());
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GetX<Click>(
                builder: (_) => Text('${secondPageClick.count1.value}times')),
            ElevatedButton(
                onPressed: () {
                  secondPageClick.count1.value++;
                  Get.toNamed(
                    '/1',
                  );
                },
                child: Text('2ndpage')),
            Obx(() {
              return Text('${secondPageClick.count2}times');
            })
          ]),
        ),
      ),
    );
  }
}
