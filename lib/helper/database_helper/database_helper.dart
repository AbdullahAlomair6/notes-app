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

  readData(sql) async {
    Database? notesDb = await db;
    List<Map> response = await notesDb!.rawQuery(sql);
    return response;
  }

  insertData(sql) async {
    Database? notesDb = await db;
    int response = await notesDb!.rawInsert(sql);
    return response;
  }

  updateData(sql) async {
    Database? notesDb = await db;
    int response = await notesDb!.rawUpdate(sql);
    return response;
  }

  deleteData(sql) async {
    Database? notesDb = await db;
    int response = await notesDb!.rawDelete(sql);
    return response;
  }
}
