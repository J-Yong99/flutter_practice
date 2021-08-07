import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stopwatch',
      home: StopWatch(),
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Timer? _timer;
  var _time = 0;

  var _isRunning = false;

  List<String> _laptimes = [];
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StopWatch'),
      ),
      body: watch(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _clickbutton();
          });
        },
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _clickbutton() {
    _isRunning = !_isRunning;
    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  Widget watch() {
    var sec = _time ~/ 100;
    var hundredth = '${_time % 100}'.padLeft(2, '0');
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Stack(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$sec',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Text('$hundredth')
                ],
              ),
              Container(
                  width: 200,
                  height: 300,
                  child: ListView(
                      children: _laptimes.map((e) => Text(e)).toList())),
            ],
          ),
          Positioned(
              left: 10.0,
              bottom: 10.0,
              child: FloatingActionButton(
                onPressed: () => _reset(),
                backgroundColor: Colors.deepOrange,
                child: Icon(Icons.rotate_left),
              )),
          Positioned(
              right: 10.0,
              bottom: 10.0,
              child: ElevatedButton(
                onPressed: () {
                  _recordLapTime('$sec.$hundredth');
                },
                child: Text('랩타임'),
              ))
        ]),
      ),
    );
  }

  void _start() {
    _timer = Timer.periodic(Duration(microseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _laptimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _laptimes.insert(_laptimes.length, '${_laptimes.length + 1}등 $time');
  }
}
