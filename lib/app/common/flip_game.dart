import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FlipGame extends StatefulWidget {
  const FlipGame({super.key});

  @override
  State<FlipGame> createState() => _FlipGameState();
}

class _FlipGameState extends State<FlipGame> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<FlipGameController>().genrateDigit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flip Game",
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.read<FlipGameController>().genrateDigit();
              },
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Consumer<FlipGameController>(builder: (context, value, _) {
        return value.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : MasonryGridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 12,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      value.tap == index
                          ? null
                          : context.read<FlipGameController>().ontap(
                              currentDigit: value.allDigit[index],
                              index: index);
                    },
                    child: Container(
                      height: 150,
                      color: (value.result.contains(value.allDigit[index]) ||
                              value.show == index ||
                              value.show1 == index)
                          ? Colors.white
                          : Colors.green,
                      alignment: Alignment.center,
                      child: (value.result.contains(value.allDigit[index]) ||
                              value.show == index ||
                              value.show1 == index)
                          ? Text(
                              value.allDigit[index].toString(),
                              style: TextStyle(fontSize: 18),
                            )
                          : Text("?"),
                    ),
                  );
                },
              );
      }),
    );
  }
}

class FlipGameController extends ChangeNotifier {
  int first = 0;
  // int secound = 0;
  int show = -1;
  int show1 = -1;
  List<int> allDigit = [];
  List<int> result = [];
  int tap = -1;
  bool loading = true;
  void changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  var random = Random();

  void genrateDigit() {
    allDigit.clear();
    tap = -1;
    result.clear();
    show = -1;
    show1 = -1;
    first = 0;
    changeLoading(true);
    while (allDigit.length < 11) {
      int anyDigit = random.nextInt(89) + 10;
      if (!allDigit.contains(anyDigit)) {
        allDigit.add(anyDigit);
        allDigit.add(anyDigit);
      }
    }
    allDigit.shuffle();

    changeLoading(false);
  }

  void ontap({required int currentDigit, required int index}) async {
    tap = index;
    if (first == 0) {
      first = currentDigit;
      show = index;
    } else {
      show1 = index;
      // secound=currentDigit;
      if (currentDigit == first) {
        show = -1;
        show1 = -1;
        first = 0;
        result.add(currentDigit);
      } else {
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));
        first = 0;
        // secound = 0;
        tap = -1;
        show = -1;
        show1 = -1;
      }
    }

    notifyListeners();
  }
}
