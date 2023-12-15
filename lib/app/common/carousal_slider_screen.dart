import 'package:flutter/material.dart';

class CarousalSliderscreen extends StatefulWidget {
  const CarousalSliderscreen({super.key});

  @override
  State<CarousalSliderscreen> createState() => _CarousalSliderscreenState();
}

class _CarousalSliderscreenState extends State<CarousalSliderscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousal"),
      ),
    );
  }
}
