//TODO: add in manifest file
/*
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
*/
//todo:add dependency
/*
hive: ^2.2.3
path_provider:
hive_flutter:
dev_dependency
build_runner:
hive_generator:
*/
//todo: create the "model class" extended with "HiveObject" ...
/*
add create all class field.. and give unique fields id and
above class name add  .. @HiveType(typeId: 0) ///model name wise unique
 above fields add....@HiveField(0)..unique foe fields.
 add this line above class ... part 'note_model.g.dart';
then run in terminal
flutter packages pub run build_runner build
*/
//TODO : add in main file and create the directery
/*
WidgetsFlutterBinding.ensureInitialized();
var directory = await getApplicationDocumentsDirectory();
Hive.init(directory.path);
Hive.registerAdapter(NoteModelAdapter());//generated file class name
await Hive.openBox<NoteModel>("note"); //database name and model class name
*/

//todo: terminal to run
/*
flutter packages pub run build_runner build
todo:get the sha1 key then go cd android then
.\gradlew signingreport     ...........use this
  */

class HiveDatabase {}
