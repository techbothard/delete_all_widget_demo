import 'package:delete_all_widget_demo/app/common/face/view/math_screen.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class ScrachScreen extends StatefulWidget {
  const ScrachScreen({super.key});

  @override
  State<ScrachScreen> createState() => _ScrachScreenState();
}

class _ScrachScreenState extends State<ScrachScreen> {
  final scratchKey = GlobalKey<ScratcherState>();
  bool scrach = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch Card"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("You have 2 spin left"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Scratcher(
                        key: scratchKey,
                        brushSize: 15,
                        threshold: 15,
                        color: Colors.purple,
                        onChange: (value) => {
                          print("value===$value"),
                          if (value > 60)
                            {
                              if (!scrach)
                                {
                                  scrach = true,
                                  scratchKey.currentState?.reveal()
                                }
                            }
                        },
                        image: Image.asset(
                          "lib/app/common/face/assets/images/istockphoto-1349086642-612x612.jpg",
                          colorBlendMode: BlendMode.srcATop,
                          color: Colors.purple.withOpacity(.4),
                          height: 200,
                          width: 200,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black)),
                          child: Text("hey"),
                        ),
                        onThreshold: () {},
                        accuracy: ScratchAccuracy.high,
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        scrach = false;
                        scratchKey.currentState?.reset();
                      },
                      child: Text("Reset"))
                ],
              ),
            ),
          )),
          Expanded(
              child: Card(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MathScreen(),
                    ));
              },
              child: Text("maths"),
            ),
          )),
        ],
      ),
    );
  }
}
