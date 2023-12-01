import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// todo:add to manifest file
// <uses-permission android:name="android.permission.INTERNET" />
//
// <queries>
// <!-- If your app checks for SMS support -->
// <intent>
// <action android:name="android.intent.action.VIEW" />
// <data android:scheme="sms" />
// </intent>
// <!-- If your app checks for call support -->
// <intent>
// <action android:name="android.intent.action.VIEW" />
// <data android:scheme="tel" />
// </intent>
// <intent>
// <action android:name="android.intent.action.VIEW" />
// <data android:scheme="*/*" />
// </intent>
// <intent>
// <action android:name="android.intent.action.SENDTO" />
// <data android:scheme="mailto" />
// </intent>
//
// </queries>

class UrlLancherScreen extends StatefulWidget {
  const UrlLancherScreen({super.key});

  @override
  State<UrlLancherScreen> createState() => _UrlLancherScreenState();
}

class _UrlLancherScreenState extends State<UrlLancherScreen> {
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController textcontroller = TextEditingController();
  GlobalKey<FormState> gk = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Url_Launcher"),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: ClipPath(
              clipper: Customcliper(),
              child: Container(
                color: Colors.redAccent,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 180,
              child: ClipPath(
                clipper: Customcliper1(),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                button("Send SMS", () {
                  showsdialog(
                      context: context,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 2,
                      title: "SMS ",
                      hint1: "number  ",
                      hint2: "message",
                      checks: true,
                      methods: () => sendSms(numbercontroller.text.trim(),
                          textcontroller.text.trim()),
                      fk: gk);
                }),
                const SizedBox(
                  height: 15,
                ),
                button("Send Email", () {
                  showsdialog(
                      context: context,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 2,
                      checks: false,
                      title: "Email ",
                      hint1: "email address",
                      hint2: "message",
                      methods: () => emailMsg(numbercontroller.text.trim(),
                          textcontroller.text.trim()),
                      fk: gk);
                }),
                const SizedBox(
                  height: 15,
                ),
                button("Phone Call", () {
                  showsdialog(
                      context: context,
                      checks: true,
                      numbercontroller: numbercontroller,
                      textcontroller: textcontroller,
                      input: 1,
                      title: "Phone ",
                      hint1: "number ",
                      hint2: "message",
                      methods: () => phoneCall(numbercontroller.text),
                      fk: gk);
                }),
                const SizedBox(
                  height: 15,
                ),
                button(
                  "Whats App Message",
                  () {
                    showsdialog(
                        checks: true,
                        context: context,
                        numbercontroller: numbercontroller,
                        textcontroller: textcontroller,
                        input: 2,
                        title: "WhatsApp ",
                        hint1: "Phone Number  ",
                        hint2: "message",
                        methods: () => whatsAppMsg(numbercontroller.text.trim(),
                            textcontroller.text.trim()),
                        fk: gk);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                button("link fire", () async {
                  try {
                    await launchUrl(Uri.parse(
                        "https://play.google.com/store/apps/details?id=com.spaceapegames.beatstar&hl=en&gl=US"));
                  } catch (e) {}
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String title, VoidCallback function) {
    return RawMaterialButton(
      fillColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(color: Colors.white),
      onPressed: function,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class Customcliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 70);
    path.quadraticBezierTo(width / 5, height, width * .5, 110);
    path.quadraticBezierTo(width * .75, 50, width, height - 40);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//hello change
class Customcliper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path()
      ..moveTo(0, height)
      ..lineTo(0, 60)
      ..quadraticBezierTo(width * .25, 160, width * .5, 80)
      ..quadraticBezierTo(width * .78, -0, width, height - 90)
      ..lineTo(width, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

showsdialog(
    {required BuildContext context,
    required TextEditingController numbercontroller,
    required TextEditingController textcontroller,
    required int input,
    required Function methods,
    required GlobalKey<FormState> fk,
    required String title,
    required String hint1,
    required String hint2,
    required bool checks}) {
  showDialog(
    context: context,
    builder: (context) => Form(
      key: fk,
      child: SimpleDialog(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        contentPadding: const EdgeInsets.all(15),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        children: [
          textfield(
            controller: numbercontroller,
            hinttext: hint1,
            check: checks ? true : false,
            validation: (v) {
              if (v!.isEmpty) {
                return "required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          input > 1
              ? textfield(
                  check: false,
                  controller: textcontroller,
                  hinttext: hint2,
                  validation: (v) {
                    if (v!.isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              if (fk.currentState?.validate() == true) {
                methods();
                Future.delayed(const Duration(seconds: 3)).whenComplete(() {
                  textcontroller.clear();
                  numbercontroller.clear();
                  Navigator.pop(context);
                });
              }
            },
            child: const Text("Send",
                style: TextStyle(
                    backgroundColor: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.green)),
          ),
        ],
      ),
    ),
  );
}

emailMsg(
  String mail,
  String msg,
) async {
  Uri url = Uri(
      scheme: 'mailto',
      path: mail,
      query:
          'subject=${Uri.encodeComponent("test is herer")}&body=${Uri.encodeComponent(msg)}');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    if (kDebugMode) {
      print("error in the email=========");
    }
  }
}

whatsAppMsg(String number, String msg) async {
  Uri uri = Uri.parse("whatsapp://send?phone=+91$number&text=$msg");
  Uri iosuri = Uri.parse("https://wa.me/+919512829152?text=hello");
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    throw ("whats error");
  }
  if (Platform.isIOS) {
    if (await canLaunchUrl(iosuri)) {
      launchUrl(iosuri);
    } else {
      throw ("ios error");
    }
  }
}

sendSms(String number, String msg) async {
  final Uri sms = Uri(
      scheme: "sms",
      path: "+91$number",
      queryParameters: {'body': Uri.encodeComponent(msg)});
  if (await canLaunchUrl(sms)) {
    await launchUrl(sms);
  } else {
    if (kDebugMode) {
      print("sms cannot launch=======");
    }
  }
}

phoneCall(String number) async {
  Uri uri = Uri(scheme: "tel", path: number);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    if (kDebugMode) {
      print("phone can not launch-----------");
    }
  }
}

Widget textfield(
    {required TextEditingController controller,
    required String hinttext,
    required bool check,
    String? Function(String?)? validation}) {
  return TextFormField(
    controller: controller,
    validator: validation,
    keyboardType: check ? TextInputType.number : TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: hinttext,
    ),
  );
}
