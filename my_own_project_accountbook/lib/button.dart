import 'package:flutter/material.dart';

class PushButton extends StatelessWidget {
  const PushButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Text('return'));
  }
}

