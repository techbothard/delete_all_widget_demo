import 'dart:math';

import 'package:flutter/material.dart';

class AnimateContenerScreen extends StatefulWidget {
  const AnimateContenerScreen({super.key});

  @override
  State<AnimateContenerScreen> createState() => _AnimateContenerScreenState();
}

class _AnimateContenerScreenState extends State<AnimateContenerScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  int tap = -1;
  bool expanded = false;
  void toggle() {
    expanded = !expanded;
    if (expanded) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    setState(() {});
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          SizedBox(
            height: 30,
          ),
          ...List.generate(
            5,
            (index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (tap == index) {
                        tap = -1;
                      } else {
                        tap = index;
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: tap == index ? Colors.green : Colors.purple),
                    alignment: Alignment.centerRight,
                    child: Icon(
                      tap == index
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      size: 18,
                    ),
                  ),
                ),
                if (tap == index)
                  Column(
                    children: [
                      ...List.generate(
                        5,
                        (index1) => Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.purpleAccent),
                          alignment: Alignment.center,
                          child: Text("$index--$index1"),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    sizeFactor: CurvedAnimation(
                        parent: animationController, curve: Curves.linear),
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
                              onPressed: () {}, child: Text("SizeTranslation"))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
