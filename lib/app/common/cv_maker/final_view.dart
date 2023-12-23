import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class FinalViewScreen extends StatefulWidget {
  String pathPDF;
  FinalViewScreen({super.key, required this.pathPDF});

  @override
  State<FinalViewScreen> createState() => _FinalViewScreenState();
}

class _FinalViewScreenState extends State<FinalViewScreen> {
  @override
  void initState() {
    super.initState();

    pdfPinchController ==
        PdfControllerPinch(document: PdfDocument.openFile(widget.pathPDF));
  }

  PdfControllerPinch? pdfPinchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Resume"),
      ),
      body: PdfViewPinch(
        controller: pdfPinchController ??=
            PdfControllerPinch(document: PdfDocument.openFile(widget.pathPDF)),
        scrollDirection: Axis.vertical,
        onDocumentLoaded: (document) {
          setState(() {});
        },
        onPageChanged: (page) {
          setState(() {});
        },
      ),
    );
  }
}
