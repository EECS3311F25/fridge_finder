import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'fridge.dart';

class Item {
  final int? id;
  final String name;
  final int quantity;
  final DateTime expiryDate;
  final Fridge fridge; 
  final Image imageIcon; 

  Item({
    this.id,
    required this.name,
    required this.quantity,
    required this.expiryDate,
    required this.fridge,
    required this.imageIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'expiryDate': expiryDate.toIso8601String(),
      'fridgeId': fridge.id, 
      'imageIcon': imageIcon,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      expiryDate: DateTime.parse(map['expiryDate']),
      fridge: Fridge(
        id: map['fridgeId']
      ),
      imageIcon: map['imageIcon'] ?? '',
    );
  }
}

class ItemDatabaseHelper {
    /*
  static final ItemDatabaseHelper instance = ItemDatabaseHelper._instance();
  static Database? _database;

  ItemDatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'item.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE item (
        id INTEGER PRIMARY KEY,
        name TEXT,
        quantity INTEGER,
        expiryDate TEXT,
        fridgeId INTEGER,
        imageIcon TEXT
      )
    ''');
  }

  Future<int> insertItem(Item item) async {
    Database db = await instance.db;
    return await db.insert('item', item.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAllItems() async {
    Database db = await instance.db;
    return await db.query('item');
  }

  Future<int> updateItem(Item item) async {
    Database db = await instance.db;
    return await db.update(
      'item',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    Database db = await instance.db;
    return await db.delete('item', where: 'id = ?', whereArgs: [id]);
  }*/
}
