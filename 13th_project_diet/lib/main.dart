import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DIET',
      home: Diet(),
    );
  }
}

class Diet extends StatefulWidget {
  const Diet({Key? key}) : super(key: key);

  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState

    controller.addListener(() {
      print('height is ${controller.text}');
    });
    controller2.addListener(() {
      print('weight is ${controller2.text}');
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text('비만도 계산기')),
        body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Height', border: OutlineInputBorder()),
                    controller: controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter height';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Weight', border: OutlineInputBorder()),
                    controller: controller2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter weight';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BmiPage(
                                      double.parse(controller.text.trim()),
                                      double.parse(controller2.text.trim()))));
                        }
                      },
                      child: Text('result')),
                )
              ],
            )),
      ),
    );
  }
}

class BmiPage extends StatelessWidget {
  BmiPage(this.height, this.weight);
  late final double height;
  late final double weight;

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));
    late String state = calBmi(bmi);
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          '''$state
    ''',
          style: TextStyle(fontSize: 50.0),
        ),
      ),
    );
  }
}

String calBmi(double bmi) {
  if (bmi >= 35) {
    return '고도 비만';
  } else if (bmi >= 30) {
    return '2단계 비만';
  } else if (bmi >= 25) {
    return '1단계 비만';
  } else if (bmi >= 23) {
    return '과체중';
  } else if (bmi >= 18.5) {
    return '정상';
  } else {
    return '저체중';
  }
}
