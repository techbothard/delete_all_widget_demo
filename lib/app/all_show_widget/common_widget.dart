import 'dart:io';

import 'package:delete_all_widget_demo/app/common/google_map_screen.dart';
import 'package:delete_all_widget_demo/app/common/pdf_view_screen.dart';
import 'package:delete_all_widget_demo/app/common/slider_box.dart';
import 'package:delete_all_widget_demo/app/common/stagger_view.dart';
import 'package:delete_all_widget_demo/app/common/story_view.dart';
import 'package:delete_all_widget_demo/app/common/url_launcher.dart';
import 'package:delete_all_widget_demo/app/database/hive/hive_screen.dart';
import 'package:delete_all_widget_demo/app/database/sqf/sqf_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../common/bottom_navigation_bar.dart';
import '../common/button.dart';
import '../common/dialog_all.dart';
import '../common/dropdownall.dart';
import '../common/pay.dart';
import '../common/shader_mask.dart';
import '../common/tab_bar.dart';
import '../common/textfield.dart';

class CommonWidget extends StatefulWidget {
  const CommonWidget({super.key});

  @override
  State<CommonWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                            content: Text("material banner"),
                            backgroundColor: Colors.green,
                            leading: Icon(Icons.error_outline),
                            actions: [
                          TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .removeCurrentMaterialBanner();
                              },
                              child: Text(
                                "close",
                                style: TextStyle(color: Colors.white),
                              ))
                        ]));
                  },
                  child: Text("Material banner")),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabBarDemo(),
                        ));
                  },
                  icon: Icon(Icons.tab),
                  label: Text("Tab bar")),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ButtonAll(),
                      ));
                },
                icon: Icon(Icons.radio_button_checked),
                label: Text("Button all"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DropDownAll(),
                        ));
                  },
                  child: Text("Drop down")),
              TextButton(
                child: const Text("Open alert dialog"),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: const Color(0x01000000),
                    builder: (BuildContext context) {
                      return Dialog(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: SizedBox(
                          height: 290,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Stack(
                            children: [
                              const Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.close,
                                      size: 90,
                                    ),
                                  )),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                height: 240,
                                child: ClipPath(
                                  clipper: DialogClipper(),
                                  child: Container(
                                      color: Colors.pink,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [Text("Dialog Content")],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DialofAll(),
                      ));
                },
                label: Text("Dialog"),
                icon: Icon(Icons.add_alert),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbars(),
                        ));
                  },
                  child: Text("Bottom navigation bar")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PayMentIntigration(),
                        ));
                  },
                  child: Text("pay UPI")),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaggerViewScreen(),
                      ));
                },
                child: Text("stagger grid view//masonary Gridview.builder"),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HiveScreen(),
                        ));
                  },
                  child: Text("Hive Databse")),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SliderBoxs(),
                      ));
                },
                child: Text("Slider box like chate app"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.orangeAccent,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UrlLancherScreen(),
                        ));
                  },
                  child: Text("Url Launcher")),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShaderMaskScreen(),
                      ));
                },
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: <Color>[
                        Colors.purpleAccent.shade700,
                        Colors.pink.shade700
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Shader Mask",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.5,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryViewScreen(),
                      ),
                    );
                  },
                  child: Text("Story Views")),
              OutlinedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles();

                    if (result == null) return;
                    final pdfPath = result.paths[0];
                    print("path-${pdfPath}");
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewScreen(path: pdfPath!),
                        ));
                  },
                  child: Text("Pdf view-pdfx")),
              OutlinedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GoogleMapDcreen(),
                        ));
                  },
                  child: Text("Google map marker")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextInputField(
                            controller: TextEditingController(),
                            hintText: "Enter the Password",
                            validate: (v) {
                              if (v!.isEmpty) {
                                return "required";
                              }
                              return null;
                            },
                            obsecure: true,
                            suffix: true,
                            textInputType: TextInputType.visiblePassword,
                          ),
                        ));
                  },
                  child: Text("Textfield"))
            ],
          ),
        ),
      ),
    );
  }
}

class DialogClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final h = size.height;
    final w = size.width;
    final heightOnTop = h * 0.05;
    final path = Path()
      ..moveTo(0, heightOnTop)
      ..lineTo(w * 0.35, heightOnTop)
      ..arcToPoint(Offset(size.width * 0.65, heightOnTop),
          radius: Radius.circular(w * 0.15), clockwise: false)
      ..lineTo(w, heightOnTop)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..lineTo(0, heightOnTop);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
