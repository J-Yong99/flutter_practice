import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'checkboxtest',
      home: Ckbox(),
    );
  }
}

class Ckbox extends StatefulWidget {
  const Ckbox({Key? key}) : super(key: key);

  @override
  _CkboxState createState() => _CkboxState();
}

enum Gender {
  Man,
  Woman,
}

class _CkboxState extends State<Ckbox> {
  var _isChecked = false;
  List<String> _valueList = ['first', 'second', 'third'];
  var _selectedValue = 'first';
  late DateTime _selectedTime;
  Gender? _gender = Gender.Man;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('checkbox/radio/switch'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(9.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val!;
                        print('$_isChecked');
                      });
                    }),
                SizedBox(
                  height: 50,
                ),
                Switch(
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val;
                        print('$_isChecked');
                      });
                    }),
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  title: Text('남자'),
                  leading: Radio<Gender>(
                      value: Gender.Man,
                      groupValue: _gender,
                      onChanged: (Gender? val) {
                        setState(() {
                          _gender = val;
                        });
                      }),
                ),
                ListTile(
                  title: Text('여자'),
                  leading: Radio<Gender>(
                      value: Gender.Woman,
                      groupValue: _gender,
                      onChanged: (Gender? val) {
                        setState(() {
                          _gender = val;
                        });
                      }),
                ),
                SizedBox(
                  height: 50,
                ),
                DropdownButton(
                  value: _selectedValue,
                  items: _valueList
                      .map((val) => DropdownMenuItem(
                            value: val,
                            child: Text(val),
                          ))
                      .toList(),
                  onChanged: (String? val) {
                    setState(() {
                      _selectedValue = val!;
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Future<DateTime?> selectedDate = showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2030),
                              builder: (BuildContext? context, Widget? child) =>
                                  Theme(data: ThemeData.dark(), child: child!))
                          .then((datetime) {
                        setState(() {
                          _selectedTime = datetime!;
                        });
                      });
                    },
                    child: Text('$_selectedTime'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
