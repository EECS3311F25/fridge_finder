import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';
import 'item.dart';

class Fridge {
  final int? id;
  final User user;
  final List<Item> items;

  Fridge({this.id, required this.user, required this.items});

  Map<String, dynamic> toMap() {
    return {'id': id, 'user': user, 'items': items};
  }

  factory Fridge.fromMap(Map<String, dynamic> map) {
    return Fridge(
      id: map['id'],
      user: map['user'],
      items: map['items'], //will be fetched later with fridge.id
    );
  }
}

class FridgeDatabaseHelper {
  /*static final FridgeDatabaseHelper instance = FridgeDatabaseHelper._instance();
  static Database? _database;

  FridgeDatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'fridge.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE fridge (
        id INTEGER PRIMARY KEY,
        userId INTEGER
      )
    ''');
  }

  Future<int> insertFridge(Fridge fridge) async {
    Database db = await instance.db;
    return await db.insert('fridge', fridge.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllFridges() async {
    Database db = await instance.db;
    return await db.query('fridge');
  }

  Future<int> updateFridge(Fridge fridge) async {
    Database db = await instance.db;
    return await db.update(
      'fridge',
      fridge.toMap(),
      where: 'id = ?',
      whereArgs: [fridge.id],
    );
  }

  Future<int> deleteFridge(int id) async {
    Database db = await instance.db;
    return await db.delete('fridge', where: 'id = ?', whereArgs: [id]);
  } */
}
