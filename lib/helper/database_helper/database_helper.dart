import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes.db');
    Database db = await openDatabase(path, onCreate: _onCreate, version: 1);
    return db;
  }

  _onCreate(Database db, int? version) async {
    await db.execute('''
    CREATE TABLE "notes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "note" TEXT
    )
    ''');
  }

  readData() async {
    Database? notesDb = await db;
    List<Map> response = await notesDb!.rawQuery("SELECT * FROM notes");
    return response;
  }

  insertData(textData) async {
    Database? notesDb = await db;
    int response = await notesDb!.rawInsert('''
        INSERT INTO notes(note)
        VALUES ("$textData")
        ''');
    return response;
  }

  updateData(textData, Map<dynamic, dynamic> list) async {
    Database? notesDb = await db;
    int response = await notesDb!.rawUpdate(
      "UPDATE notes SET note = '$textData' WHERE id = ${list['id']}",
    );
    return response;
  }

  deleteData(Map<dynamic, dynamic> list) async {
    Database? notesDb = await db;
    int response = await notesDb!.rawDelete(
      "DELETE FROM notes WHERE id = ${list['id']}",
    );
    return response;
  }
}
