import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counts.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Provider.of<Counts>(context, listen: false).add();
            },
            child: Icon(Icons.add)),
        SizedBox(
          width: 40,
        ),
        ElevatedButton(
            onPressed: () {
              Provider.of<Counts>(context, listen: false).remove();
            },
            child: Icon(Icons.remove))
      ],
    );
  }
}
