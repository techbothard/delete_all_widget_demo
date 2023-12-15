import 'package:flutter/material.dart';

class AnimateContenerScreen extends StatefulWidget {
  const AnimateContenerScreen({super.key});

  @override
  State<AnimateContenerScreen> createState() => _AnimateContenerScreenState();
}

class _AnimateContenerScreenState extends State<AnimateContenerScreen> {
  int tap = -1;
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
          )
        ],
      ),
    );
  }
}
