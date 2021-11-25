import 'package:flutter/material.dart';
import 'package:my_own_project_accountbook/model.dart';

Widget base(Model model) {
  return Container(
    height: 299.7,
    width: 205.7,
    //margin: EdgeInsets.fromLTRB(4, 20, 4, 20),
    color: Colors.grey[600],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${model.name}',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        Column(
          children: [
            Container(
              height: 35.0,
              width: 150.0,
              // color: Colors.grey[350],
              child: TextButton(
                autofocus: true,
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.grey[350],
                  elevation: 0.0,
                  minimumSize: Size(200, 100),
                ),
                onPressed: () {},
                child: Text('${model.cost}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    )),
              ),
            ),
            SizedBox(
              height: 100.0,
              width: 10.0,
            ),
            Text(
              '80%',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
