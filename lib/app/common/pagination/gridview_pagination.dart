import 'package:delete_all_widget_demo/app/common/pagination/pagination_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridPagination extends StatefulWidget {
  const GridPagination({super.key});

  @override
  State<GridPagination> createState() => _GridPaginationState();
}

class _GridPaginationState extends State<GridPagination> {
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
        title: Text("Grid Pagination"),
      ),
      body: Consumer<PaginationController>(
        builder: (context, v, _) {
          return v.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  controller: controller
                    ..addListener(() {
                      if (controller.position.pixels >=
                              controller.position.maxScrollExtent - 100 &&
                          !context.read<PaginationController>().enter) {
                        context.read<PaginationController>().enterLoading(true);
                        context.read<PaginationController>().loadDate();
                      }
                    }),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: v.count,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.amberAccent,
                            alignment: Alignment.center,
                            child: Text("$index"),
                          );
                        },
                      ),
                      if (v.enter && !v.end)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (v.end)
                        Center(
                          child: Text("no Data Found"),
                        ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
