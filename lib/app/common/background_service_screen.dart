import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class BackGroundServiceScreen extends StatefulWidget {
  const BackGroundServiceScreen({super.key});

  @override
  State<BackGroundServiceScreen> createState() =>
      _BackGroundServiceScreenState();
}

class _BackGroundServiceScreenState extends State<BackGroundServiceScreen> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Background Service"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                FlutterBackgroundService().invoke("setAsForeground");
              },
              child: Text("setAsForeground")),
          ElevatedButton(
              onPressed: () {
                FlutterBackgroundService().invoke("setAsBackground");
              },
              child: Text("setAsBackground")),
          ElevatedButton(
              onPressed: () async {
                final service = FlutterBackgroundService();
                var isrunning = await service.isRunning();
                if (isrunning) {
                  service.invoke("stopService");
                  text = "stop";
                } else {
                  service.startService();
                  text = "start";
                }

                setState(() {});
              },
              child: Text("stopservice")),
          Text(text),
          ElevatedButton(
            onPressed: () {},
            child: Text("Method Channel"),
          ),
        ],
      ),
    );
  }
}
