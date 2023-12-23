import 'dart:math';

import 'package:delete_all_widget_demo/app/common/face/view/capch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({super.key});

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  int a = Random.secure().nextInt(99);
  int b = Random.secure().nextInt(99);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Math Quiz"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200),
            alignment: Alignment.center,
            child: Text(
              "${a} + $b",
              style: TextStyle(fontSize: 16),
            ),
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 100),
                  hintText: "Right Answer",
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                if (a + b == int.parse(controller.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("DONE "),
                    backgroundColor: Colors.green,
                  ));
                  a = Random().nextInt(90);
                  b = Random.secure().nextInt(99);
                  controller.clear();
                  FocusScope.of(context).unfocus();
                  setState(() {});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("In Correct "),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text("Submit Answer")),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CapchScreen(),
                    ));
              },
              child: Text("capcha"))
        ],
      ),
    );
  }
}
