import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController rowController = TextEditingController();
  TextEditingController colController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: rowController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: TextField(
                  controller: colController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      int a = int.parse(rowController.text.trim());
                      int b = int.parse(colController.text.trim());
                      context.read<GridCountController>().setIndexList(a, b);
                    },
                    child: Text("Submit"))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<GridCountController>(
              builder: (context, value, child) {
                return value.loading
                    ? CircularProgressIndicator()
                    : GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemCount: value.column * value.row,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: value.column),
                        itemBuilder: (context, index) {
                          int row = index ~/ value.column;
                          int col = index % value.column;
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: FittedBox(
                                child: Text(
                                    value.spiralGrid[row][col].toString())),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GridCountController extends ChangeNotifier {
  bool loading = true;
  void changeLoading(bool v) {
    loading = v;
    notifyListeners();
  }

  int row = 0;
  int column = 0;
  List<List<int>> spiralGrid = [];
  void setIndexList(int a, int b) {
    changeLoading(true);
    row = a;
    column = b;
    spiralGrid = generateSpiralGrid(a, b);
    changeLoading(false);
  }

  List<List<int>> generateSpiralGrid(int rows, int columns) {
    List<List<int>> grid =
        List.generate(rows, (r) => List<int>.filled(columns, 0));
    print("grid start--_$grid");
    int num = 1;
    int top = 0, bottom = rows - 1, left = 0, right = columns - 1;

    while (top <= bottom && left <= right) {
      for (int i = left; i <= right; i++) {
        grid[top][i] = num++;
      }
      top++;

      for (int i = top; i <= bottom; i++) {
        grid[i][right] = num++;
      }
      right--;

      if (top <= bottom) {
        for (int i = right; i >= left; i--) {
          grid[bottom][i] = num++;
        }
        bottom--;
      }

      if (left <= right) {
        for (int i = bottom; i >= top; i--) {
          grid[i][left] = num++;
        }
        left++;
      }
    }

    return grid;
  }
}
