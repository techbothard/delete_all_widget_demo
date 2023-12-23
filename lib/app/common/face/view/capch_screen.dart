import 'dart:math';

import 'package:flutter/material.dart';
import 'package:local_captcha/local_captcha.dart';

class CapchScreen extends StatefulWidget {
  const CapchScreen({super.key});

  @override
  State<CapchScreen> createState() => _CapchScreenState();
}

class _CapchScreenState extends State<CapchScreen> {
  // Init controller.
  final _localCaptchaController = LocalCaptchaController();
  var _configFormData = ValueKey("12");
  @override
  void dispose() {
    _localCaptchaController.dispose();

    super.dispose();
  }

  TextEditingController controller = TextEditingController();
  int valukeyValue = Random.secure().nextInt(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Captcha"),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            LocalCaptcha(
              key: ValueKey(valukeyValue),
              controller: _localCaptchaController,
              height: 50,
              width: 300,
              backgroundColor: Colors.grey[100]!,
              chars: 'abdefghnryABDEFGHNQRY3468',
              length: 5,
              fontSize: 40.0,
              textColors: [
                Colors.black54,
                Colors.grey,
                Colors.blueGrey,
                Colors.redAccent,
                Colors.teal,
                Colors.amber,
                Colors.brown,
              ],
              noiseColors: [
                Colors.black54,
                Colors.grey,
                Colors.blueGrey,
                Colors.redAccent,
                Colors.teal,
                Colors.amber,
                Colors.brown,
              ],
              caseSensitive: false,
              codeExpireAfter: Duration(minutes: 10),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200),
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                onTapOutside: (v) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    hintText: "Right Answer",
                    border: InputBorder.none),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final a = _localCaptchaController.validate(controller.text);
                  if (a == LocalCaptchaValidation.valid) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Done")));
                    _localCaptchaController.onRefresh;
                    controller.clear();
                    valukeyValue = Random().nextInt(100);

                    setState(() {});
                  } else {
                    print("Asdasd==$a");
                  }
                },
                child: Text("Tap"))
          ],
        ),
      ),
    );
  }
}
