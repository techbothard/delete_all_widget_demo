import 'package:delete_all_widget_demo/app/database/hive/hive.dart';
import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0) //model ni id .jem model alag tem id alag
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String descreption;

  NoteModel(this.title, this.descreption);
}

@HiveType(typeId: 1)
class NotebookModel {}
