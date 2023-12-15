import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with TickerProviderStateMixin {
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 0;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      currentPage = pageController.page?.round() ?? 0;
      if (mounted) {
        setState(() {});
      }
    });
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    animation =
        Tween<double>(begin: 0.0, end: 180).animate(animationController);
    animationView =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    genrateList();
    animationController1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(Duration(seconds: 5), () {
        toggle1();
      });
    });
  }

  late Animation<double> animation;
  late AnimationController animationController;
  late Animation<double> animationView;
  bool expanded = false;
  void toggle() {
    expanded = !expanded;
    if (expanded) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    setState(() {});

    print("value-${animation.value}");
  }

  late AnimationController animationController1;
  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  List<Widget> listData = [];
  void genrateList() {
    for (int i = 0; i < 15; i++) {
      listData.add(Container(
        key: Key(i.toString()),
        color: i.isEven ? Colors.orangeAccent : Colors.amberAccent,
        height: 50,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(i.toString()),
      ));
    }
  }

  bool show = false;
  void toggle1() {
    if (!show) {
      animationController1.forward();
    } else {
      animationController1.reverse();
    }
    show = !show;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   toolbarHeight: 130,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text("Bottom Sheet"),
      //   flexibleSpace: Image.asset(
      //     "assets/images/img_image_8.png",
      //     fit: BoxFit.cover,
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizeTransition(
                sizeFactor: CurvedAnimation(
                    parent: animationController1, curve: Curves.linear),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("You hsve no internet \n check the network"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                toggle1();
                              },
                              child: Text("Fix IT")),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.maxFinite,
                    foregroundDecoration:
                        BoxDecoration(color: Colors.black87.withOpacity(.3)),
                    child: Image.asset(
                      "assets/images/img_image_7.png",
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                  Container(
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/img_image_2.png",
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                // margin: EdgeInsets.all(10),
                width: double.maxFinite,
                transform: Matrix4.translationValues(0, -20, 0),
                child: Card(
                  // margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Feachur",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Feachur",
                        ),
                        Text(
                          "Feachur",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: dialoagSheet, child: Text("BottomSheet")),
              ExpansionTile(
                title: Text("ExpansionTile"),
                children: [
                  Text("There is expansion tile to collapse and expande here"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hide",
                    textAlign: TextAlign.right,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text("Card and Transform.rotate"),
                        Spacer(),
                        Transform.rotate(
                          angle: expanded ? pi : 0,
                          child: IconButton(
                            onPressed: toggle,
                            icon: Icon(Icons.expand_more),
                          ),
                        )
                      ],
                    ),
                    SizeTransition(
                        sizeFactor: animationView,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("ASfgdsas"),
                              SizedBox(
                                height: 20,
                              ),
                              Text("ASfgdsas"),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text("SizeTranslation"))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              ReorderableListView(
                shrinkWrap: true,
                primary: false,
                children: [...listData],
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) newIndex--;
                  final data = listData.removeAt(oldIndex);
                  listData.insert(newIndex, data);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialoagSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  "afasfsfdhjsfdmnsdhj\nsgazsafagdguj\ngdgdqasdqwred\nabcdefghijklmnopqrstuvwxyz"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Submit"))
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget pageView() {
    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          itemCount: 5,
          onPageChanged: (value) {
            print(pageController.page);
            // setState(() {});
          },
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/img_image_${index + 1}.png",
                      height: 500,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (currentPage != 4) {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeOutSine);
                        } else {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("Finish")));
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: Text(currentPage == 4 ? "Start" : "Next"),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 200,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  5,
                  (index) => Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: currentPage == index
                                ? Colors.black87
                                : Colors.black87.withOpacity(.6),
                            shape: BoxShape.circle),
                      )),
            ],
          ),
        )
      ],
    );
  }
}
