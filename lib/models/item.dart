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
  final DateTime dateAdded;
  final DateTime expiryDate;
  final Fridge fridge;
  final Image? imageIcon;

  Item({
    this.id,
    this.fdcId,
    required this.name,
    required this.quantity,
    required this.dateAdded,
    required this.expiryDate,
    required this.fridge,
    this.imageIcon,
  });

  Item create({
    int? id,
    int? fdcId,
    String? name,
    int? quantity,
    DateTime? dateAdded,
    DateTime? expiryDate,
    Fridge? fridge,
    Image? imageIcon,
  }) {
    return Item(
      id: id ?? this.id,
      fdcId: fdcId ?? this.fdcId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      dateAdded: dateAdded ?? this.dateAdded,
      expiryDate: expiryDate ?? this.expiryDate,
      fridge: fridge ?? this.fridge,
      imageIcon: imageIcon ?? this.imageIcon,
    );
  }

  static Future<Item> createAndInsert(
    int? fdcId,
    String name,
    int quantity,
    DateTime dateAdded,
    DateTime expiryDate,
    Fridge fridge,
    Image? imageIcon,
  ) async {
    final Item tempItem = Item(
      fdcId: fdcId,
      name: name,
      quantity: quantity,
      dateAdded: dateAdded,
      expiryDate: expiryDate,
      fridge: fridge,
      imageIcon: imageIcon,
    );

    final int newId = await ItemDatabaseHelper.instance.insert(tempItem);

    return tempItem.create(id: newId);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'dateAdded': dateAdded,
      'expiryDate': expiryDate,
      'fridgeId': fridge.id,
      'imageIcon': imageIcon.toString(), // database expects a path, placeholder
    };
  }

  static Future<Item> fromMap(Map<String, dynamic> map) async {
    final Fridge fridge = await Fridge.getFromDb(map['fridge']);

    return Item(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      dateAdded: map['dateAdded'],
      expiryDate: map['expiryDate'],
      fridge: fridge,
      imageIcon: map['imageIcon'] ?? '',
    );
  }
}

class ItemDatabaseHelper extends DatabaseHelper<Item> {
  static final ItemDatabaseHelper instance = ItemDatabaseHelper._instance();

  ItemDatabaseHelper._instance();

  @override
  Future<int> insert(Item item) async {
    Database db = await instance.db;
    return await db.insert('item', item.toMap());
  }

  static Future<Map<String, dynamic>> query(int id) async {
    List<Map<String, dynamic>> items = await instance.queryAll();
    return items.firstWhere((map) => map['id'] == id);
  }

  static Future<List<Map<String, dynamic>>> queryByFridge(int fridgeId) async {
    List<Map<String, dynamic>> items = await instance.queryAll();
    return items.where((x) => x['fridgeId'] == fridgeId).toList();
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
