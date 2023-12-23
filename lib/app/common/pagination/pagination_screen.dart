import 'dart:async';

import 'package:delete_all_widget_demo/app/common/pagination/gridview_pagination.dart';
import 'package:delete_all_widget_demo/app/common/pagination/listview_pagination.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  State<PaginationScreen> createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pagination"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (context) => PaginationController(),
                            child: GridPagination()),
                      ));
                },
                child: Text("GridView Pagination"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) => PaginationController(),
                              child: ListPagination()),
                        ));
                  },
                  child: Text("Listview Pagination")),
            ],
          ),
        ));
  }
}

class PaginationController extends ChangeNotifier {
  //for loading and no data
  bool end = false;
  bool enter = false;
  void enterLoading(bool c) {
    enter = c;
    notifyListeners();
  }

  //list
  int count = 0;
  //enisaly loading
  bool loading = true;
  void changeLoading(bool v) {
    loading = v;
    notifyListeners();
  }

  void loadDate() async {
    print("end-$end");
    if (end) return;
    if (count == 0) {
      changeLoading(true);
    }
    // if(count!=10){
    //   enterLoading(true);
    // }

    await Future.delayed(Duration(seconds: 4));
    count += 10;
    print("count--$count");

    if (count == 100) {
      end = true;
    }
    enterLoading(false);

    changeLoading(false);
  }
}
