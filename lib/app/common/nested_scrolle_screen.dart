import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NestedScrolleScreen extends StatefulWidget {
  const NestedScrolleScreen({super.key});

  @override
  State<NestedScrolleScreen> createState() => _NestedScrolleScreenState();
}

class _NestedScrolleScreenState extends State<NestedScrolleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Icon(Icons.menu),
                actions: [Icon(Icons.search), Icon(Icons.more_vert)],
                expandedHeight: 200,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Colors.deepPurpleAccent),
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/img_image_8.png",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Container(
                    height: 100,
                    transform: Matrix4.translationValues(0, 50, 0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [Text("body")],
          )),
    );
  }
}
