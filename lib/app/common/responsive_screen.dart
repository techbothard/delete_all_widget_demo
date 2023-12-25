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
    print("asd==${MediaQuery.of(context).size.width}");
    print("asd==${MediaQuery.of(context).size.height}");

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
