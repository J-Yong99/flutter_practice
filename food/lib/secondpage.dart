import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBar(
          ctext: "사진분석",
          onlPressed: () {
            Get.back();
          },
          onaPressed: () {
            dialog(context);
          },
          atext: "건너뛰기"),
      body: Container(
        child: Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Rectangle.png',
                width: 360,
                height: 670,
              )
            ],
          ),
        ),
      ),
    );
  }
}
