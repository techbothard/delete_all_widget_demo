import 'dart:async';

import 'package:delete_all_widget_demo/app/common/face/view/wheel_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    Timer(Duration(seconds: 2), () {
      toggole();
    });
  }

  void toggole() {
    show = true;
    setState(() {});
    controller.forward();
  }

  bool show = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(children: [
            Image.asset(
              "lib/app/common/face/assets/images/splash.png",
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  Radiate Youthful Beauty",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!show)
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(
                                strokeWidth: 7,
                                color: Colors.white,
                                backgroundColor:
                                    Colors.pinkAccent.withOpacity(.2),
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizeTransition(
                      axis: Axis.horizontal,
                      sizeFactor: CurvedAnimation(
                          parent: controller, curve: Curves.linear),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WheelScreen(),
                              ));
                        },
                        child: Container(
                          height: 45,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.pinkAccent.withOpacity(.5)),
                          child: Text(
                            "Lets Start",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
