import 'package:flutter/material.dart';

class PoltlineScreen extends StatefulWidget {
  const PoltlineScreen({super.key});

  @override
  State<PoltlineScreen> createState() => _PoltlineScreenState();
}

class _PoltlineScreenState extends State<PoltlineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Polyline Map"),
      ),
    );
  }
}
