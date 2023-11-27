import 'package:delete_all_widget_demo/app/database/hive/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'boxes/box.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Database"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO:open and put or get data
          // var box = await Hive.openBox("Kundan");
          // box.put("name", "kundan_name");
          // box.put("age", 25);
          // box.put("map", {"name": "developer", "age": 25});
          //
          // print(
          //   box.get("name"),
          // );
          // print(
          //   box.get("name")['name'],
          // );
          // print(
          //   box.get("age"),
          // );
          dialoag();
        },
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder<Box<NoteModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, value, child) {
          var data = value.values.toList().cast<NoteModel>();
          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].descreption),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          titleController.text = data[index].title;
                          desController.text = data[index].descreption;

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("edit note"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: titleController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: desController,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        data[index].title =
                                            titleController.text;
                                        data[index].descreption =
                                            desController.text;
                                        await data[index].save();
                                      },
                                      child: Text("add"))
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                      onPressed: () async {
                        await data[index].delete();
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          final box = await Hive.openBox("Age");
          // box.put("age", "25");

          final darta = box.get("age");
          print(darta);
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.blueAccent,
          height: 50,
          child: Text("add"),
        ),
      ),
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  void dialoag() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Note"),
          content: Column(
            children: [
              TextField(
                controller: titleController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: desController,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  final data =
                      NoteModel(titleController.text, desController.text);
                  final box = Boxes.getData();
                  box.add(data);
                  // data.save(); when use flutte_hive and extend hiveobject to the model
                  titleController.clear();
                  desController.clear();
                  Navigator.pop(context);
                },
                child: Text("Add")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancel"))
          ],
        );
      },
    );
  }
}
