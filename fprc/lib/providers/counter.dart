import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counts.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('counter');
    return Text(
      Provider.of<Counts>(context).count.toString(),
      // context.watch<Counts>().count.toString(),
      style: TextStyle(fontSize: 20),
    );
  }
}
