import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  
  static Database? database;

  Future<Database?> get db async{
    if(database == null){
      database = await initialData();
      return database;
    }else{
      return database;
    }
  }
  initialData()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'note3.db');
    Database myDB = await openDatabase(path,onCreate: onCreate,onUpgrade:onUpgrade,version: 2 );
    return myDB;
  }
  onUpgrade(Database db , int version, int newVersion)async{
    //await db.execute("ALTER  TABLE notes ADD COLUMN color TEXT");
  }
  Future onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE tableNotes ( 
      id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      note TEXT NOT NULL,
      color TEXT NOT NULL
      )'''
    );
    await batch.commit();
  }

  readData(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }


  insertData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }


  read(String table) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.query(table);
    return response;
  }


  insert(String table,Map<String,Object?> values) async {
    Database? myDB = await db;
    int response = await myDB!.insert(table,values);
    return response;
  }

  update(String table,Map<String,Object?> values,String myWhere) async {
    Database? myDB = await db;
    int response = await myDB!.update(table,values,where: myWhere);
    return response;
  }

  delete(String tableName,String myWhere) async {
    Database? myDB = await db;
    int response = await myDB!.delete(tableName,where: myWhere);
    return response;
  }

  myDeleteDatabase()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'note3.db');
    await deleteDatabase(path);
  }
}
