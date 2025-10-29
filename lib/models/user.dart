import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'databasehelper.dart';

class User {
  final int? id;
  final String username;
  final String email;
  final String password;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
}

class UserDatabaseHelper extends DatabaseHelper<User> {
  static final UserDatabaseHelper instance = UserDatabaseHelper._instance();
  static Database? _database;

  UserDatabaseHelper._instance();

  @override
  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  @override
  Future<int> insert(User user) async {
    Database db = await instance.db;
    return await db.insert('user', user.toMap());
  }

  @override
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.db;
    return await db.query('user');
  }

  @override
  Future<int> update(User user) async {
    Database db = await instance.db;
    return await db.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  @override
  Future<int> delete(int id) async {
    Database db = await instance.db;
    return await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }
}
