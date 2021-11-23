import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

class PhotoAnalysisIntroPage extends StatefulWidget {
  const PhotoAnalysisIntroPage({Key? key}) : super(key: key);

  @override
  State<PhotoAnalysisIntroPage> createState() => _PhotoAnalysisIntroPageState();
}

class _PhotoAnalysisIntroPageState extends State<PhotoAnalysisIntroPage> {
  bool a = true;
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    await Future.delayed(Duration(milliseconds: 500));
    this.a = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.a = true;
    super.dispose();
  }

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
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/Rectangle.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      'assets/images/Mask Group.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                        top: 92,
                        right: 40,
                        child: Container(
                          // width: 196,
                          // height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: AnimatedOpacity(
                            opacity: a ? 0.0 : 1.0,
                            duration: Duration(milliseconds: 2000),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.ac_unit,
                                    size: 42,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "국내 최초",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        top: 192,
                        right: 80,
                        child: Container(
                          // width: 196,
                          // height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.ac_unit,
                                  size: 42,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "대규모 실데이터",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 488,
                        //right: 20,
                        left: 184,
                        child: Container(
                          // width: 196,
                          // height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.ac_unit,
                                  size: 42,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "최신 딥러닝",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 588,
                        left: 16,
                        child: Container(
                          // width: 196,
                          // height: 64,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.ac_unit,
                                  size: 42,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "512차원 미세 특징 분석",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Text(
                    "인공지능 사진 분석",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Text.rich(TextSpan(
                      style: TextStyle(fontSize: 16),
                      text: "나만의 ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "맞춤 케어 추천",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        TextSpan(
                          text: "을 인공지능이 도와줍니다.",
                          style: TextStyle(fontSize: 16),
                        )
                      ])),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Text.rich(TextSpan(
                      style: TextStyle(fontSize: 16),
                      text: "내 모습을 512개의 미세 특징으로 분석, 각 특징의 값을 활용해 ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "정교하게 세부 타입을 분류",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        TextSpan(
                          text: "합니다.",
                          style: TextStyle(fontSize: 16),
                        )
                      ])),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Text(
                    "회원님의 모든 데이터는 항상 안전하게 보관됩니다. 약관에 명시된 기간 후에 자동 파기되며, 또는 언제든 원하실 때 영구히 파기 가능합니다. 어떤 데이터도 제 3자와 절대 공유되지 않습니다.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 24, child: ActionButton(text: "분석하기", onPressed: () {}))
        ],
      ),
    );
  }
}
