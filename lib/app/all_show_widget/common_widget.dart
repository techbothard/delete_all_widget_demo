import 'dart:developer';
import 'dart:math' as math;

import 'package:delete_all_widget_demo/app/common/background_service_screen.dart';
import 'package:delete_all_widget_demo/app/common/bottom_sheet.dart';
import 'package:delete_all_widget_demo/app/common/calender_task.dart';
import 'package:delete_all_widget_demo/app/common/carousal_slider_screen.dart';
import 'package:delete_all_widget_demo/app/common/chat_message.dart';
import 'package:delete_all_widget_demo/app/common/cv_maker/cv_pdf_view.dart';
import 'package:delete_all_widget_demo/app/common/date_time_screen.dart';
import 'package:delete_all_widget_demo/app/common/face/view/splace_screen.dart';
import 'package:delete_all_widget_demo/app/common/google_map_screen.dart';
import 'package:delete_all_widget_demo/app/common/isolate_screen.dart';
import 'package:delete_all_widget_demo/app/common/notification.dart';
import 'package:delete_all_widget_demo/app/common/otp_field.dart';
import 'package:delete_all_widget_demo/app/common/pagination/animated_ci=ontener_screen.dart';
import 'package:delete_all_widget_demo/app/common/pagination/pagination_screen.dart';
import 'package:delete_all_widget_demo/app/common/pdf_view_screen.dart';
import 'package:delete_all_widget_demo/app/common/responsive_screen.dart';
import 'package:delete_all_widget_demo/app/common/screenshot_screen.dart';
import 'package:delete_all_widget_demo/app/common/slider_box.dart';
import 'package:delete_all_widget_demo/app/common/sound_app_screen.dart';
import 'package:delete_all_widget_demo/app/common/stagger_view.dart';
import 'package:delete_all_widget_demo/app/common/state_city_screen.dart';
import 'package:delete_all_widget_demo/app/common/story_view.dart';
import 'package:delete_all_widget_demo/app/common/test_screen.dart';
import 'package:delete_all_widget_demo/app/common/url_launcher.dart';
import 'package:delete_all_widget_demo/app/common/zoom_screen.dart';
import 'package:delete_all_widget_demo/app/database/hive/hive_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../common/bottom_navigation_bar.dart';
import '../common/button.dart';
import '../common/checkbox.dart';
import '../common/custome_painter.dart';
import '../common/dialog_all.dart';
import '../common/dropdownall.dart';
import '../common/flip_game.dart';
import '../common/nested_scrolle_screen.dart';
import '../common/paralax_effect.dart';
import '../common/pay.dart';
import '../common/scffold_screen.dart';
import '../common/shader_mask.dart';
import '../common/stock_check_screen.dart';
import '../common/tab_bar.dart';
import '../common/textfield.dart';
import '../common/web_soccet.dart';

class CommonWidget extends StatefulWidget {
  const CommonWidget({super.key});

  @override
  State<CommonWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    NotificationService().firebaseForground(context);
    NotificationService().firebaseBackground(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
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
                  child: Text("Textfield")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) => FlipGameController(),
                              builder: (context, child) {
                                return FlipGame();
                              }),
                        ));
                  },
                  child: Text("Flip Game")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) => CalenderController(),
                              builder: (context, child) {
                                return CalenderTaskScreen();
                              }),
                        ));
                  },
                  child: Text("calender task")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpFieldScreen(),
                        ));
                  },
                  child: Text("Otp_feild")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StateCityScreen(),
                        ));
                  },
                  child: Text("State city picker  ")),
              TextButton(
                  clipBehavior: Clip.hardEdge,
                  onPressed: () async {
                    final result =
                        await Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChatMessageScreen();
                      },
                    ));
                    print("result are---$result");
                  },
                  child: Text("Chat App")),
              OutlinedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("object");
                    log("Asd");
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestScreen()));
                },
                child: Text("Test"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomScreen(),
                      ),
                    );
                  },
                  child: Text("Zoom Page")),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return CheckBox_Radio_Screen();
                    },
                  ));
                },
                child: Text("Check Box"),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaginationScreen(),
                      ));
                },
                child: Text("Pagination page"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResponsiveBreakpoints.builder(
                              child: ResponsiveScreen(),
                              breakpoints: [
                                Breakpoint(start: 0, end: 350, name: MOBILE),
                                Breakpoint(start: 351, end: 600, name: TABLET),
                                Breakpoint(start: 601, end: 800, name: DESKTOP),
                                Breakpoint(start: 801, end: 1700, name: "XL")
                              ]);
                        },
                      ),
                    );
                  },
                  child: Text("Responsive Widget")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimateContenerScreen(),
                        ));
                  },
                  child: Text("animated container")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomSheetScreen(),
                        ));
                  },
                  child: Text("BottomSheet")),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DateTimeScreen(),
                      ));
                },
                child: Text("Time /date/progressbar"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amberAccent)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NestedScrolleScreen(),
                        ));
                  },
                  child: Text("NestedScrollerView")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StockCheckScreen(),
                        ));
                  },
                  child: Text("Stock check")),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarousalSliderscreen(),
                      ));
                },
                title: Text("Carousal Slider"),
              ),
              ListTile(
                tileColor: Colors.orangeAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IsolateScreen(),
                    ),
                  );
                },
                title: Text("isoLate"),
              ),
              ListTile(
                tileColor: Colors.orangeAccent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BackGroundServiceScreen(),
                    ),
                  );
                },
                title: Text("backGround Service"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SoundAppScreen(),
                        ));
                  },
                  child: Text("Sound app")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CVPdfScreen(),
                        ));
                  },
                  child: Text("CV Show")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplaceScreen(),
                        ));
                  },
                  child: Text("Face Check ")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ));
                  },
                  child: Text("Notification show")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenShotScreen(),
                        ));
                  },
                  child: Text("Image SS Share")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExampleParallax(),
                        ));
                    // Navigator.push(
                    //     context,
                    //     PageRouteBuilder(
                    //       pageBuilder:
                    //           (context, animation, secondaryAnimation) {
                    //         return ExampleParallax();
                    //       },
                    //       transitionsBuilder:
                    //           (context, animation, secondaryAnimation, child) {
                    //         return FadeTransition(
                    //           opacity: animation,
                    //           child: child,
                    //         );
                    //       },
                    //       opaque: false,
                    //       barrierColor: null,
                    //       barrierLabel: null,
                    //       maintainState: true,
                    //       transitionDuration: Duration(milliseconds: 500),
                    //     ));
                  },
                  child: Text("Paralax Effect")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebSoccetScreen(),
                        ));
                  },
                  child: Text("Web Socket")),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CutomPainterScreen(),
                      ));
                },
                child: Text("Custom Painters"),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScaffoldScreen(),
                      ));
                },
                child: Text("Scafflod "),
              ),
              SizedBox(
                height: 20,
                child: Container(
                  color: Colors.black,
                ),
              ),
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
