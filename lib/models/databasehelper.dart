import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DatabaseHelper<T> {
  static Database? _database;

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'fridge_finder.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version);

  Future<int> insert(T t);

  Future<List<Map<String, dynamic>>> queryAll();

  Future<int> update(T t);

  Future<int> delete(int id);
}
