import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {required this.color,
      required this.image,
      required this.onpressed,
      required this.radius,
      required this.text});

  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            text,
            Opacity(
              opacity: 0.0,
              child: Image.asset('images/google-logo.png'),
            ),
          ],
        ),
        color: color,
        onPressed: onpressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
