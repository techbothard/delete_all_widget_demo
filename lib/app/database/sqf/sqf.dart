//TODO: add in manifest file
// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
// <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
//TODO : add in void main

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfDatabase {
  SqfDatabase._();
  static SqfDatabase _database = SqfDatabase._();
  factory SqfDatabase() {
    print("insert of database");
    return _database;
  }

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    return _db = await init();
  }

  Future<Database> init() async {
    final path = await getApplicationDocumentsDirectory();
    final data = join(path.path, "DATABASE.db");
    return await openDatabase(data, version: 1, onCreate: oncreate);
  }

  oncreate(Database db, int version) async {
    return db.execute('''
    CREATE TABLE IF NOT EXISTS table(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50),
    age INTGER(3),
    city VARCHAR(50),
    marks VARCHAR(50)
    )
    ''');
  }

  Future insertData(Map<String, dynamic> map) async {
    final db = await SqfDatabase().db;
    final index = await db.insert("table", map); // first method
    db.rawInsert(
        "INSERT INTO table (column name)values (column value)"); // secound method
    print(index);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await SqfDatabase().db;
    final result = await db.query("table"); //first method
    db.rawQuery("SELECT * FROM table"); //secound method
    return result;
  }

  Future<void> updateData(Map<String, dynamic> map) async {
    final db = await SqfDatabase().db;
    await db
        .update("table", map, where: 'id=?', whereArgs: [map['id']]); // first
    // db.rawUpdate("UPDATE table SET col1='value'");
  }

  Future<void> deleteData(int id) async {
    final db = await SqfDatabase().db;
    await db.delete("table", where: 'id=?', whereArgs: [id]);
  }
}

/*
class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();

  static Database? _database;

  NoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB("notes.db");
    return _database!;
  }

  Future<Database> initDB(String filepath) async {
    String dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idtype = "INTEGER PRIMERY KEY AUTOINCREAMENT";
    final booltype = "BOOLEAN NOT NULL";
    final inttype = "INTEGER NOT NULL";
    final texttype = "TEXT NOT NULL";
    db.execute('''
     CREATE TABLE $tablenote(
     ${NotesField.id} $idtype,
     ${NotesField.isImportant} $booltype,
     ${NotesField.number} $inttype,
     ${NotesField.title} $texttype,
     ${NotesField.description} $texttype,
     ${NotesField.time} $texttype
     )
     ''');
  }

  Future<Notes> create(Notes note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tablenote, note.toJson());
    return note.copy(id: id);
  }

  Future<Notes> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablenote,
      columns: NotesField.values,
      where: '${NotesField.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Notes.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Notes>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NotesField.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tablenote, orderBy: orderBy);

    return result.map((json) => Notes.fromJson(json)).toList();
  }

  Future<int> update(Notes note) async {
    final db = await instance.database;

    return db.update(
      tablenote,
      note.toJson(),
      where: '${NotesField.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablenote,
      where: '${NotesField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
*/
