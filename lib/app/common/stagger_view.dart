import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggerViewScreen extends StatefulWidget {
  const StaggerViewScreen({super.key});

  @override
  State<StaggerViewScreen> createState() => _StaggerViewScreenState();
}

class _StaggerViewScreenState extends State<StaggerViewScreen> {
  List images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',
    'assets/images/a5.png',
    'assets/images/a6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Masonry  Gridview"),
      ),
      body: Container(
        child: MasonryGridView.builder(
          itemCount: 20,
          padding: EdgeInsets.symmetric(horizontal: 10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.orangeAccent,
              child: Column(
                children: [
                  Image.asset(
                    images[(index + 1) % 6],
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("All asd"),
                  Text("All asd"),
                  Text("All asd"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
