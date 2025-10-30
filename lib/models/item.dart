import 'dart:async';
import 'dart:ui';

import 'package:sqflite/sqflite.dart';

import 'databasehelper.dart';
import 'fridge.dart';

class Item {
  final int? id;
  final int? fdcId;
  String name;
  int quantity;
  final DateTime expiryDate;
  final Fridge fridge;
  final Image? imageIcon;

  Item({
    this.id,
    this.fdcId,
    required this.name,
    required this.quantity,
    required this.expiryDate,
    required this.fridge,
    this.imageIcon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'expiryDate': expiryDate,
      'fridgeId': fridge.id,
      'imageIcon': null, // database expects a path, placeholder
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      expiryDate: map['expiryDate'],
      fridge: map['fridge'],
      imageIcon: map['imageIcon'] ?? '',
    );
  }
}

class ItemDatabaseHelper extends DatabaseHelper<Item> {
  static final ItemDatabaseHelper instance = ItemDatabaseHelper._instance();
  static Database? _database;

  ItemDatabaseHelper._instance();

  @override
  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  @override
  Future onCreate(Database db, int version) async {
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

  @override
  Future<int> insert(Item item) async {
    Database db = await instance.db;
    return await db.insert('item', item.toMap());
  }

  @override
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.db;
    return await db.query('item');
  }

  @override
  Future<int> update(Item item) async {
    Database db = await instance.db;
    return await db.update(
      'item',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    Database db = await instance.db;
    return await db.delete('item', where: 'id = ?', whereArgs: [id]);
  }
}
