//TODO: add in manifest file
/*
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
*/
//TODO : add in main file and create the directery
/*
WidgetsFlutterBinding.ensureInitialized();
var directory = await getApplicationDocumentsDirectory();
Hive.init(directory.path);
Hive.registerAdapter(NoteModelAdapter());
await Hive.openBox<NoteModel>("note");
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
//todo: terminal to run
/*
flutter packages pub run build_runner build
todo:get the sha1 key then go cd android then
.\gradlew signingreport     ...........use this
  */

class HiveDatabase {}
