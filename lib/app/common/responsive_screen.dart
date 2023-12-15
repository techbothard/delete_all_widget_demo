import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ResponsiveScreen extends StatefulWidget {
  const ResponsiveScreen({super.key});

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("devicepixel==${ui.window.devicePixelRatio}");
    print("Size==${ui.window.physicalSize}");
    print("asd==${MediaQuery.of(context).size.width}");
    print("asd==${MediaQuery.of(context).size.height}");
    print("appbar--${MediaQuery.of(context).padding.top}");
    print("original appbar-${AppBar().preferredSize.height}");
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Responsive"),
      ),
      body: Column(
        children: [
          Container(
            width: 360,
            height: 756 - 97,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class AppSize {
  late double height;
  late double width;
  late double heightFactore;
  late double widthFactore;
  late double textFactore;
  Size ourSize = Size(360, 690);
  init(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    heightFactore = height / ourSize.height;
    widthFactore = width / ourSize.width;
    textFactore = min(heightFactore, widthFactore);
  }

  double setHeight(double ht) => ht * heightFactore;
  double setWidth(double wt) => wt * widthFactore;
  double setSp(double tx) => tx * textFactore!;
}

extension Appsize on num {
  double get ht => this * AppSize().heightFactore;
  double get wt => this * AppSize().widthFactore;
  double get sp => this * AppSize().textFactore!;
}
