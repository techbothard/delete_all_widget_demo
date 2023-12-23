import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolate screen"),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/giphy.gif"),
          ElevatedButton(
              onPressed: () {
                final total = complexTime();
                debugPrint("total----\$$total");
              },
              child: Text("Tap Complex Task")),
          ElevatedButton(
              onPressed: () async {
                final receivePOrt = ReceivePort();
                await Isolate.spawn(complextTask2, receivePOrt.sendPort);
                receivePOrt.listen((message) {
                  debugPrint("total--$message");
                });
              },
              child: Text("Tap Complex Task using isolate")),
          ElevatedButton(
              onPressed: () async {
                try {
                  final receivePOrt = ReceivePort();
                  await Isolate.spawn(
                      complextTask3, [receivePOrt.sendPort, 1000000000]);

                  final data = await receivePOrt.first;
                  debugPrint("total-#########-$data");
                } catch (e) {
                  print("error\n$e");
                }
              },
              child: Text("Tap Complex Task using isolate parse value")),
        ],
      ),
    );
  }

  double complexTime() {
    var total = 0.0;
    for (int i = 0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }
}

complextTask2(SendPort sendPort) {
  ///todo:always difine out side the class becuase dart run one thread..
  var total = 0.0;
  for (int i = 0; i < 100000000; i++) {
    total += i;
  }
  sendPort.send(total);
}

complextTask3(List<dynamic> args) {
  final sendPort = args[0];
  final end = args[1];
  var total = 0.0;
  for (int i = 0; i < end; i++) {
    total += i;
  }
  Isolate.exit(sendPort, total);
}
