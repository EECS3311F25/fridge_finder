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

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
      ALTER TABLE item RENAME COLUMN imageIcon TO imagePath,
      ALTER TABLE item ADD COLUMN frozen INTEGER NOT NULL,
      ALTER TABLE item ADD COLUMN frozenDifferential INTEGER NOT NULL
    ''');
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY NOT NULL,
        username TEXT,
        email TEXT,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE fridge (
        id INTEGER PRIMARY KEY NOT NULL,
        userId INTEGER
        FOREIGN KEY userId REFERENCES user(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE item (
        id INTEGER PRIMARY KEY NOT NULL,
        fdcId INTEGER,
        name TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        dateAdded TEXT NOT NULL,
        expiryDate TEXT NOT NULL,
        fridgeId INTEGER NOT NULL,
        imagePath TEXT,
        FOREIGN KEY fridgeId REFERENCES fridge(id),
        frozen INTEGER NOT NULL,
        frozenDifferential INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insert(T t);

  Future<List<Map<String, dynamic>>> queryAll();

  Future<int> update(T t);

  Future<int> delete(int id);
}
