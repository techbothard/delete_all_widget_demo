import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';

class SliderBoxs extends StatefulWidget {
  const SliderBoxs({super.key});

  @override
  State<SliderBoxs> createState() => _SliderBoxsState();
}

class _SliderBoxsState extends State<SliderBoxs> {
  final BoxController boxController = BoxController();
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        controller: boxController,
        minHeight: MediaQuery.of(context).size.height / 3,
        maxHeight: MediaQuery.of(context).size.height - 50 - 95,
        body: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
              ),
              title: Text("Index=$index"),
            );
          },
        ),
        backdrop: Backdrop(
            fading: true,
            color: Colors.blueGrey,
            appBar: BackdropAppBar(
                title: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("AppBar"),
                ),
                leading: Icon(Icons.menu)),
            body: Padding(
              padding: const EdgeInsets.only(top: 70.0, bottom: 70),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  // Text(timestamp.toString()),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                  ListTile(
                    title: Text("hello"),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (v) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "as"),
          BottomNavigationBarItem(icon: Icon(Icons.remove), label: "as"),
        ],
      ),
    );
  }

  void check() {}
}
