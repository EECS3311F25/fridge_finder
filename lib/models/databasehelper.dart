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
      version: 6,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle version 3: rename column
    if (oldVersion < 3) {
      try {
        await db.execute('ALTER TABLE item RENAME COLUMN imageIcon TO imagePath');
      } catch (e) {
        // Column might already be renamed
      }
    }
    
    // Handle version 4: add frozen column
    if (oldVersion < 4) {
      try {
        await db.execute('ALTER TABLE item ADD COLUMN frozen INTEGER NOT NULL DEFAULT 0');
      } catch (e) {
        // Column might already exist
      }
    }
    
    // Handle version 5: add frozenDifferential column
    if (oldVersion < 5) {
      try {
        await db.execute('ALTER TABLE item ADD COLUMN frozenDifferential INTEGER NOT NULL DEFAULT 0');
      } catch (e) {
        // Column might already exist
      }
    }
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
        userId INTEGER,
        FOREIGN KEY (userId) REFERENCES user(id)
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
        frozen INTEGER NOT NULL,
        frozenDifferential INTEGER NOT NULL,
        FOREIGN KEY (fridgeId) REFERENCES fridge(id)
      )
    ''');
  }

  Future<int> insert(T t);

  Future<List<Map<String, dynamic>>> queryAll();

  Future<int> update(T t);

  Future<int> delete(int id);
}
