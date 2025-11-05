import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'user.dart';
import 'item.dart';
import 'databasehelper.dart';

class Fridge {
  final int? id;
  final User user;
  final List<Item>? items;

  const Fridge._({this.id, required this.user, this.items});

  Fridge create({int? id, User? user, List<Item>? items}) {
    return Fridge._(
      id: id ?? this.id,
      user: user ?? this.user,
      items: items ?? this.items,
    );
  }

  static Future<Fridge> createAndInsert(User user) async {
    final tempFridge = Fridge._(user: user, items: []);

    final int newId = await FridgeDatabaseHelper.instance.insert(tempFridge);

    return tempFridge.create(id: newId);
  }

  static Future<Fridge> getFromDb(int fridgeId) async {
    final Map<String, dynamic> fridgeMap = await FridgeDatabaseHelper.query(
      fridgeId,
    );

    final Map<String, dynamic> userMap = await UserDatabaseHelper.query(
      fridgeMap['userId'],
    );
    final User user = User.fromMap(userMap);

    final List<Map<String, dynamic>> itemMaps =
        await ItemDatabaseHelper.queryByFridge(fridgeId);
    final List<Item> items = await Future.wait(
      itemMaps.map((map) async => await Item.fromMap(map)),
    );

    return Fridge._(id: fridgeMap['id'], user: user, items: items);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'user': user.id};
  }

  static Future<Fridge> fromMap(Map<String, dynamic> map) async {
    final User user = User.fromMap(await UserDatabaseHelper.query(map['user']));

    final List<Map<String, dynamic>> itemMaps =
        await ItemDatabaseHelper.queryByFridge(map['id']);
    final List<Item> items = await Future.wait(
      itemMaps.map((map) async => await Item.fromMap(map)),
    );

    return Fridge._(id: map['id'], user: user, items: items);
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

  static Future<Map<String, dynamic>> query(int id) async {
    Database db = await instance.db;
    List<Map<String, dynamic>> maps = await db.query(
      'fridge',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    throw Exception('Fridge with ID $id not found');
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
