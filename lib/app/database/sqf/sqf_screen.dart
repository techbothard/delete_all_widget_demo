import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SqfScreen extends StatefulWidget {
  const SqfScreen({super.key});

  @override
  State<SqfScreen> createState() => _SqfScreenState();
}

class _SqfScreenState extends State<SqfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Database"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //todo: to add dialog to add
          showDialogs();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showDialogs() {}
}
