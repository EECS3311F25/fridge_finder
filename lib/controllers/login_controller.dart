import '../models/fridge.dart';
import '../models/item.dart';
import '../models/user.dart';


class LoginController {
  final UserDatabaseHelper _dbHelper = UserDatabaseHelper.instance;

  Future<User> login(String username, String password) async {
    final db = await _dbHelper.db;

    final result = await db.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );

    if (result.isEmpty) {
      throw Exception('Invalid username or password');
    }

    return User.fromMap(result.first);
  }

  Future<void> createUser(String username, String password) async {
    final user = User(
      username: username,
      email: '$username@example.com',
      password: password,
    );

    await UserDatabaseHelper.instance.insert(user);
  }

  Future<List<User>> getAllUsers() async {
    final db = await _dbHelper.db;
    final result = await db.query('user');
    return result.map((map) => User.fromMap(map)).toList();
  }
}

