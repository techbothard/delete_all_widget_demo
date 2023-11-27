import 'package:hive/hive.dart';

import '../model.dart';

class Boxes {
  static Box<NoteModel> getData() => Hive.box<NoteModel>("note");
}
