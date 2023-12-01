import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewScreen extends StatefulWidget {
  String path;
  PdfViewScreen({super.key, required this.path});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  @override
  void initState() {
    super.initState();

    pdfPinchController ==
        PdfControllerPinch(document: PdfDocument.openFile(widget.path));
  }

  PdfControllerPinch? pdfPinchController;

  int totalPage = 0;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pdf view"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Total page=$totalPage"),
              IconButton(
                  onPressed: () {
                    pdfPinchController?.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Text("Current page=$currentPage"),
              IconButton(
                  onPressed: () {
                    pdfPinchController?.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  icon: Icon(Icons.arrow_forward_ios)),
            ],
          ),
          Expanded(
            child: PdfViewPinch(
              controller: pdfPinchController ??= PdfControllerPinch(
                  document: PdfDocument.openFile(widget.path)),
              scrollDirection: Axis.vertical,
              onDocumentLoaded: (document) {
                setState(() {
                  totalPage = document.pagesCount;
                });
              },
              onPageChanged: (page) {
                currentPage = page;
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
