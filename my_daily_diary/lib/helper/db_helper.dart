import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    sql.openDatabase(path.join(dbPath, '$table.db'), onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE diarys (id INTEGER PRIMARY KEY, name TEXT, color TEXT, image TEXT, chapters TEXT)');
    }, version: 1);
  }
}