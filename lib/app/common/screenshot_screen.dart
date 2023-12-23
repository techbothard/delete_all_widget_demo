import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ScreenShotScreen extends StatefulWidget {
  const ScreenShotScreen({super.key});

  @override
  State<ScreenShotScreen> createState() => _ScreenShotScreenState();
}

class _ScreenShotScreenState extends State<ScreenShotScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  GlobalKey _globalKey = new GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e, st) {
      print("error===$e\n\n$st");
      return Future.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                log("heyye");
                var container = Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/img_image_1.png',
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Image.asset(
                          "assets/images/img_image_2.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                );
                screenshotController
                    .captureFromWidget(
                        InheritedTheme.captureAll(
                            context, Material(child: container)),
                        delay: Duration(microseconds: 100))
                    .then(
                  (Uint8List capturedImage) async {
                    final path = await getApplicationDocumentsDirectory();
                    File file = await File("${path.path}/hey.png");
                    file.writeAsBytesSync(capturedImage);
                    Share.shareFiles(['${path.path}/hey.png']);
                  },
                );
              },
              child: Text("Share")),
          ElevatedButton(
              onPressed: () async {
                var container = Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/img_image_1.png',
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Image.asset(
                          "assets/images/img_image_2.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                );
                final path = await getApplicationDocumentsDirectory();
                final time = DateTime.now();
                File file = File("${path.path}/$time.png");
                _capturePng().then((value) {
                  file.writeAsBytesSync(value);
                  Share.shareFiles(["${path.path}/$time.png"]);
                });
              },
              child: Text("RepaintBoundary")),
        ],
      ),
    );
  }
}
// ShowCapturedWidget(context, capturedImage);
// return showDialog(
//   useSafeArea: false,
//   context: context,
//   builder: (context) => Scaffold(
//     appBar: AppBar(
//       title: Text("Captured widget screenshot"),
//     ),
//     body: Center(child: Image.memory(capturedImage)),
//   ),
// );
