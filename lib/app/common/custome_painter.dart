import 'package:flutter/material.dart';

class CutomPainterScreen extends StatefulWidget {
  const CutomPainterScreen({super.key});

  @override
  State<CutomPainterScreen> createState() => _CutomPainterScreenState();
}

class _CutomPainterScreenState extends State<CutomPainterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Painter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 600,
              child: CustomPaint(
                size: Size(10, 600),
                painter: DashedLineVerticalPainter(),
              ),
            ),
            Container(
              width: 300,
              color: Colors.orangeAccent,
            )
          ],
        ),
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 10, dashSpace = 10, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
