import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScaffoldScreen extends StatefulWidget {
  const ScaffoldScreen({super.key});

  @override
  State<ScaffoldScreen> createState() => _ScaffoldScreenState();
}

class _ScaffoldScreenState extends State<ScaffoldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                APIDataCall().getApiCall();
              },
              child: Text("data")),
          GestureDetector(
            onTap: () {
              print("asd");
            },
            child: IgnorePointer(
              ignoring: false,
              child: FloatingActionButton.extended(
                onPressed: () {
                  print("hey");
                },
                label: Text("Bradcast"),
                icon: Image.asset(
                  "assets/icons/insta.gif",
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class APIDataCall {
  Future<void> getApiCall() async {
    try {
      final res = kDebugMode
          ? await CellWatch.cellCall(
              call: () =>
                  APIDADADA().getAPi("https://fakestoreapi.com/products"),
              endPoint: "https://fakestoreapi.com/products")
          : await APIDADADA().getAPi("https://fakestoreapi.com/products");
      print("asdasdresponse---_${res.statusCode}");
    } catch (e, st) {
      print("error---$e\n\n$st");
    }
  }
}

class APIDADADA {
  Future<dynamic> getAPi(String url) async {
    return await http.get(Uri.parse(url));
  }
}

class CellWatch {
  static Future<dynamic> cellCall(
      {required Future<dynamic> Function() call,
      required String endPoint}) async {
    print("calll!!!!!!!!!!!!!!!#!@@#!@!@@!@!@@@@@@@@@@@@@@@@@@@@@@@");
    final start = DateTime.now();
    final result = await call();
    print("asas==$result");
    final end = DateTime.now();
    final lasttime = end.difference(start).inMilliseconds;

    if (lasttime > 500) {
      log("WARNING RESPONSE", name: "******************************");
      log("WARNING RESPONSE",
          name: "END POINT__--$endPoint******DURATION___$lasttime");
      log("WARNING RESPONSE", name: "******************************");
    }
    return result;
  }
}
