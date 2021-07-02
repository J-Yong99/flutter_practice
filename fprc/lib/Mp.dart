import 'package:flutter/material.dart';
import 'package:fprc/Airpollution.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

void func() async {
  AirPollution data = AirPollution();
  await data.getAirpollution();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suwon'),
      ),
    );
  }
}
