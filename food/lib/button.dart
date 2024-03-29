import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food/colors.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

//ActionButton
//required: text,onPressed | default value: enabled=true, upshadow=false, downshadow=true
class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.enabled = true,
      this.upshadow = false,
      this.downshadow = true})
      : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool upshadow;
  final bool downshadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: upshadow ? Colors.grey : Colors.transparent,
            spreadRadius: -8,
            blurRadius: 10,
            offset: Offset(0, -10),
          ),
          BoxShadow(
              color: downshadow ? Colors.grey : Colors.transparent,
              spreadRadius: -8,
              blurRadius: 10,
              offset: Offset(0, 10))
        ],
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width - 64, 56),
              primary: DARK_BLUE_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: enabled ? this.onPressed : null,
          child: Text(
            this.text,
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}

//SmallButton
//required: text,onPressed
class SmallButton extends StatelessWidget {
  SmallButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  VoidCallback? onPressed;
  double dWidth = 128;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(
                  128 <= constraints.maxWidth - 48
                      ? constraints.maxWidth - 48
                      : 128,
                  40),
              primary: BLUE_COLOR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: this.onPressed,
          child: Text(
            this.text,
            style: TextStyle(fontSize: 16),
          ));
    });
  }
}

//CheckItem
//required: isChecked,onChanged
class CheckItem extends StatelessWidget {
  CheckItem({Key? key, required this.isChecked, required this.onChanged})
      : super(key: key);
  bool isChecked;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 24,
      child: ListTile(
        leading: RoundCheckBox(
            checkedColor: Colors.transparent,
            checkedWidget: Image.asset(
              'assets/images/checkIcon.png',
              fit: BoxFit.fill,
            ),
            isChecked: isChecked,
            onTap: onChanged,
            size: 24),
        title: Text(
          "data",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

//slider
//required: sliderValue,onChanged,max | default value: division=null
class DefSlider extends StatelessWidget {
  DefSlider({
    Key? key,
    required this.sliderValue,
    required this.onChanged,
    required this.max,
    this.division = null,
  }) : super(key: key);

  double sliderValue;
  final double max;
  final int? division;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderThemeData(
            activeTrackColor: BLUE_COLOR,
            inactiveTrackColor: LIGHT_GREY_COLOR,
            thumbColor: LIGHT_GREY_COLOR),
        child: Slider(
            min: 0,
            max: max,
            label: sliderValue.round().toString(),
            divisions: division,
            value: sliderValue,
            onChanged: onChanged));
  }
}

//alertdialog
//
class dialog1 extends StatelessWidget {
  const dialog1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('''Dialog Title'''),
        ],
      ),
      //
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '''Dialog Content
                  ssdsdsadsad
                  asdasdasdasdasdasdasdasdasd
                  asdasdasdsad
                  ''',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: [
        SmallButton(text: "text", onPressed: () {}),
        SmallButton(text: "text", onPressed: () {}),
      ],
    );
  }
}

void dialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("나중에 체크하려면?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text.rich(
              TextSpan(
                text: "피부 상태는 정확한 추천에 도움이 됩니다. 언제든 ",
                style: TextStyle(fontSize: 16, color: DARK_GREY_COLOR),
                children: <TextSpan>[
                  TextSpan(
                      text: "프로필 > 피부 상태 체크 ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(text: "에서 진행 및 변경이 가능합니다.")
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 8, bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("취소",
                      style: TextStyle(color: DARK_GREY_COLOR))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF001C2A),
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 8, bottom: 8),
                      shadowColor: Colors.grey,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {},
                  child: const Text("건너뛰기"))
            ])
          ]),
        );
      });
}

void dialog11(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: AlertDialog(
            actionsPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('''나중에 분석하려면?'''),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '''사진 분석은 정확한 추천에 도움이 됩니다.
                  언제든 프로필>사진 분석에서 진행 및 변경이 가능합니다.
                  ''',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: [
              SmallButton(text: "취소", onPressed: () {}),
              SmallButton(text: "건너뛰기", onPressed: () {}),
            ],
          ),
        );
      });
}

//Dialog
//
// void dialog(BuildContext context) {
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             return Column(
//               // mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Dialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24.0)),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width - 96,
//                       height: 232,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               alignment: Alignment.topLeft,
//                               child:
//                                   Text("Title", style: TextStyle(fontSize: 20)),
//                               margin: EdgeInsets.fromLTRB(24, 24, 24, 24),
//                               height: 24,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               child: Text('''Titledsd
//      sdsds
//                                       dsdsds''',
//                                   style: TextStyle(fontSize: 20)),
//                               margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
//                               //height: 72,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
//                               child: Row(
//                                 children: [
//                                   SmallButton(text: "text", onPressed: () {}),
//                                   SmallButton(text: "text", onPressed: () {})
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//               ],
//             );
//           },
//         );
//       });
// }

//TextBox
//
class TextBox extends StatelessWidget {
  const TextBox({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (val) {
          if (val!.isEmpty) {
            return 'Enter something';
          }
          return null;
        },
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
            hintText: 'Placeholder',
            hintStyle: TextStyle(color: GREY_COLOR),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide:
                    BorderSide(color: Colors.green, style: BorderStyle.none))),
      ),
    );
  }
}

//DefAppBar
//required: ctext,onlPressed,onaPressed,atext | default value: lead=true, action=true
AppBar DefAppBar({
  required String ctext,
  required void Function() onlPressed,
  required void Function() onaPressed,
  required String atext,
  bool lead = true,
  bool action = true,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      ctext,
      style: TextStyle(color: Colors.black),
    ),
    leading: lead
        ? IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: DARK_GREY_COLOR,
            ),
            onPressed: onlPressed)
        : null,
    actions: action
        ? [
            TextButton(
                onPressed: onaPressed,
                child: Text(
                  atext,
                  style: TextStyle(color: BLUE_COLOR),
                ))
          ]
        : null,
  );
}
