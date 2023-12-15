import 'package:delete_all_widget_demo/app/common/pagination/pagination_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPagination extends StatefulWidget {
  const ListPagination({super.key});

  @override
  State<ListPagination> createState() => _ListPaginationState();
}

class _ListPaginationState extends State<ListPagination> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<PaginationController>().loadDate();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Pagination"),
      ),
      body: Consumer<PaginationController>(
        builder: (context, v, _) {
          return v.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  controller: controller
                    ..addListener(() {
                      if (controller.position.pixels >=
                              controller.position.maxScrollExtent - 200 &&
                          !context.read<PaginationController>().enter) {
                        print("enter here");
                        context.read<PaginationController>().enterLoading(true);
                        context.read<PaginationController>().loadDate();
                      }
                    }),
                  itemCount: v.enter ? v.count + 1 : v.count,
                  itemBuilder: (context, index) {
                    if (index >= v.count && v.enter) {
                      if (v.end) {
                        return Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("No data Found"),
                        );
                      }
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ));
                    }
                    return Container(
                      height: 80,
                      color: Colors.yellowAccent,
                      alignment: Alignment.center,
                      child: Text("$index"),
                    );
                  },
                );
        },
      ),
    );
  }
}
