import 'dart:async';
import 'dart:math';

import 'package:delete_all_widget_demo/app/common/face/view/scarch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({super.key});

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  StreamController<int> controller = StreamController<int>();
  List colors = [
    Colors.blue,
    Colors.pinkAccent,
    Colors.pink,
    Colors.deepPurpleAccent,
    Colors.pinkAccent,
    Colors.teal,
    Colors.deepPurple,
    Colors.brown,
    Colors.deepPurpleAccent,
    Colors.lightBlue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Wheel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(color: Colors.black, width: 2)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    AbsorbPointer(
                      child: SizedBox(
                        height: 250,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 250,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: SweepGradient(colors: [
                                    Colors.orangeAccent,
                                    Colors.white,
                                    Colors.deepPurpleAccent,
                                    Colors.red,
                                    Colors.black,
                                    Colors.deepPurpleAccent
                                  ])),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              height: 250,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: SweepGradient(colors: [
                                    Colors.yellowAccent,
                                    Colors.orangeAccent,
                                    Colors.orange,
                                    Colors.yellowAccent,
                                    Colors.orangeAccent,
                                    Colors.orange,
                                  ])),
                            ),
                            Container(
                              margin: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black12)],
                                  shape: BoxShape.circle,
                                  color: Colors.black),
                              child: Stack(
                                children: [
                                  // DotPut(top: 3, left: 140),
                                  // DotPut(top: 203, left: 140),
                                  ///top=left
                                  DotPut(top: 5.25, left: 121),
                                  DotPut(top: 14.25, left: 93),
                                  DotPut(top: 29.25, left: 72),
                                  DotPut(top: 51.5, left: 54),
                                  DotPut(top: 75.75, left: 43),
                                  DotPut(top: 100, left: 40),
                                  // DotPut(top: 195, left: 100),
                                  ///bottom-left
                                  DotPut(top: 124.75, left: 42),
                                  DotPut(top: 148.5, left: 51),
                                  DotPut(top: 170.75, left: 67),
                                  DotPut(top: 187.75, left: 87),
                                  DotPut(top: 199.75, left: 110),
                                  // DotPut(top: 100, left: 40),

                                  ///top-right
                                  DotPut(top: 3.5, left: 150),
                                  DotPut(top: 12.25, left: 180),
                                  DotPut(top: 28.25, left: 207),
                                  DotPut(top: 50.5, left: 226),
                                  DotPut(top: 75.75, left: 237),
                                  DotPut(top: 105, left: 240),

                                  ///bottom-right
                                  DotPut(top: 133.75, left: 236),
                                  DotPut(top: 158.5, left: 223),
                                  DotPut(top: 183.75, left: 200),
                                  DotPut(top: 198, left: 170),
                                  DotPut(top: 203.75, left: 139),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: FortuneWheel(
                                animateFirst: false,
                                onAnimationEnd: () {},
                                duration: const Duration(milliseconds: 5000),
                                onFocusItemChanged: (value) {},
                                physics: CircularPanPhysics(
                                  duration: const Duration(seconds: 5),
                                  curve: Curves.decelerate,
                                ),
                                selected: controller.stream,
                                indicators: [
                                  FortuneIndicator(
                                      // alignment: Alignment.topCenter,
                                      child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: SweepGradient(colors: [
                                          Colors.yellowAccent,
                                          Colors.orangeAccent,
                                          Colors.orange,
                                          Colors.yellow,
                                          Colors.deepOrangeAccent,
                                          Colors.yellow,
                                          Colors.orange,
                                          Colors.yellowAccent,
                                          Colors.deepOrangeAccent,
                                          Colors.yellow,
                                          Colors.orange,
                                        ])),
                                  )),
                                  FortuneIndicator(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        transform:
                                            Matrix4.translationValues(0, -7, 0),
                                        child: TriangleIndicator(
                                          color: Colors.black,
                                        ),
                                      ))
                                ],
                                items: [
                                  ...List.generate(
                                      colors.length,
                                      (index) => FortuneItem(
                                          child: Text("$index"),
                                          style: FortuneItemStyle(
                                              color: colors[index])))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          int index = Random.secure().nextInt(colors.length);
                          print("index==$index");
                          controller.add(0);
                          controller.add(index);
                        },
                        child: Text("PLAY"))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScrachScreen(),
                        ));
                  },
                  child: Text("Secound screen"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DotPut extends StatelessWidget {
  DotPut({
    super.key,
    required this.top,
    required this.left,
  });
  double top;
  double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        child: Container(
          height: 8,
          width: 8,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ));
  }
}
