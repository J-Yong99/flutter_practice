import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamPage(),
    );
  }
}

class StreamPage extends StatelessWidget {
  // ignore: close_sinks
  StreamController<String> streamController = StreamController<String>();
  Stream<String> countStream() async* {
    for (int i = 0; i < 11; i++) {
      print('$i');
      await Future.delayed(Duration(seconds: 1));
      yield '$i';
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<String> _stream = countStream();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('practice stream & future'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Text(
                '${snapshot.data}',
                style: TextStyle(fontSize: 50.0),
              );
            else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   await for (var value in stream) {
//     sum += value;
//   }
//   return sum;
// }

// int practice() {
//   for (int i = 1; i <= 10; i++) {
//     print(i);
//   }
//   return 10;
// }

// Stream<int> countStream(int to) async* {
//   for (int i = 1; i <= to; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     print('Loading ...$i');
//     yield i;
//   }
// }

// main() async {
//   var stream;
//   print(stream);
//   stream = countStream(10);
//   print(stream);
//   //stream.listen((res) => print('done with $res'));
// }
