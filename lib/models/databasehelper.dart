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

    return await openDatabase(path, version: 1, onCreate: _onCreate, onConfigure: _onConfigure);
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT,
        password TEXT
      ),
      CREATE TABLE fridge (
        id INTEGER PRIMARY KEY,
        userId INTEGER
        FOREIGN KEY userId REFERENCES user(id)
      ),
      CREATE TABLE item (
        id INTEGER PRIMARY KEY,
        name TEXT,
        quantity INTEGER,
        dateAdded TEXT,
        expiryDate TEXT,
        fridgeId INTEGER,
        imageIcon TEXT,
        FOREIGN KEY fridgeId REFERENCES fridge(id)
      )
    ''');
  }

  Future<int> insert(T t);

  Future<List<Map<String, dynamic>>> queryAll();

  Future<int> update(T t);

  Future<int> delete(int id);
}
