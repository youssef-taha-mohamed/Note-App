import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'new.db'),
      onCreate: (database, version) async {
        Batch batch = database.batch();
        batch.execute(
          "CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,content TEXT)",
        );
        await batch.commit();
      },
      version: 1,
    );
  }

  Future<List<Object?>> clearData() async {
    final Database db = await initializeDB();
    Batch batch = db.batch();
    batch.execute("delete from users");
    return await batch.commit();
  }
}