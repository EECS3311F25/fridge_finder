import 'dart:async';

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

  User create({int? id, String? username, String? email, String? password}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  static Future<User> createAndInsert(
    String username,
    String email,
    String password,
  ) async {
    final User tempUser = User(
      username: username,
      email: email,
      password: password,
    );

    final int newId = await UserDatabaseHelper.instance.insert(tempUser);

    return tempUser.create(id: newId);
  }

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

  UserDatabaseHelper._instance();

  @override
  Future<int> insert(User user) async {
    Database db = await instance.db;
    return await db.insert('user', user.toMap());
  }

  static Future<Map<String, dynamic>> query(int id) async {
    List<Map<String, dynamic>> users = await instance.queryAll();
    return users.firstWhere((map) => map['id'] == id);
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
