import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class CalenderTaskScreen extends StatefulWidget {
  const CalenderTaskScreen({super.key});

  @override
  State<CalenderTaskScreen> createState() => _CalenderTaskScreenState();
}

class _CalenderTaskScreenState extends State<CalenderTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<CalenderController>().apiCall("Mon");
    });
  }

  String tap = "";
  List<String> day = ['Sun', 'Mon', 'Thu', 'Wen', 'Tue', 'Fri', "Sat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calender Task"),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                ...List.generate(
                    7,
                    (index) => PopupMenuItem(
                          child: Text(day[index]),
                          value: day[index],
                        ))
              ];
            },
            onSelected: (value) {
              context.read<CalenderController>().apiCall(value);
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<CalenderController>(builder: (context, value, _) {
            return value.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : MasonryGridView.builder(
                    shrinkWrap: true,
                    itemCount: value.count,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                    ),
                    itemBuilder: (context, index) {
                      if (index < 7) {
                        return Container(
                          // padding: EdgeInsets.all(3),
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.black87)),
                          alignment: Alignment.center,
                          child: Text(
                            value.day[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      } else if (value.spaces > index - 7) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Text(""),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            tap = (index - value.spaces - 6).toString();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: tap ==
                                          (index - value.spaces - 6).toString()
                                      ? Colors.green
                                      : Colors.grey.shade700,
                                  width: 1.2)),
                          alignment: Alignment.center,
                          child: Text("${index - value.spaces - 6}"),
                        ),
                      );
                    },
                  );
          }),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              tap,
            ),
          ),
        ],
      ),
    );
  }
}

class CalenderController extends ChangeNotifier {
  List<String> day = ['Sun', 'Mon', 'Thu', 'Wen', 'Tue', 'Fri', "Sat"];
  int count = 0;
  bool loading = true;
  int spaces = 0;
  void changeLoadin(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> apiCall(String number) async {
    changeLoadin(true);

    spaces = day.indexOf(number);
    print("space===$spaces");
    count = 30 + spaces + 7;
    await Future.delayed(Duration(seconds: 3));
    changeLoadin(false);
  }
}
