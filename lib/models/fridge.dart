import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'user.dart';
import 'item.dart';
import 'databasehelper.dart';

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

class FridgeDatabaseHelper extends DatabaseHelper<Fridge> {
  static final FridgeDatabaseHelper instance = FridgeDatabaseHelper._instance();

  FridgeDatabaseHelper._instance();

  @override
  Future<int> insert(Fridge fridge) async {
    Database db = await instance.db;
    return await db.insert('fridge', fridge.toMap());
  }

  @override
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.db;
    return await db.query('fridge');
  }

  @override
  Future<int> update(Fridge fridge) async {
    Database db = await instance.db;
    return await db.update(
      'fridge',
      fridge.toMap(),
      where: 'id = ?',
      whereArgs: [fridge.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    Database db = await instance.db;
    return await db.delete('fridge', where: 'id = ?', whereArgs: [id]);
  }
}
