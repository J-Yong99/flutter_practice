import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sliver',
      home: Sliver(),
    );
  }
}

class Sliver extends StatefulWidget {
  const Sliver({Key? key}) : super(key: key);

  @override
  _SliverState createState() => _SliverState();
}

class _SliverState extends State<Sliver> {
  bool _isChecked = false;
  late DateTime _selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Icon(
                Icons.access_alarm_outlined,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                children: [
                  Switch(
                      value: _isChecked,
                      onChanged: (val) {
                        setState(() {
                          _isChecked = val;
                          print('$_isChecked');
                        });
                      }),
                  ElevatedButton(
                      onPressed: () {
                        Future<DateTime?> selectedDate = showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime(2030),
                            builder: (BuildContext? context, Widget? child) =>
                                Theme(
                                    data: ThemeData.dark(),
                                    child: child!)).then((datetime) {
                          setState(() {
                            _selectedTime = datetime!;
                          });
                        });
                      },
                      child: Text('$_selectedTime'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
