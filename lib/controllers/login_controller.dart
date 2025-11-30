import '../models/user.dart';

class LoginController {
  final UserDatabaseHelper _dbHelper = UserDatabaseHelper.instance;
  
  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  Future<User> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password cannot be empty');
    }

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

    final user = User.fromMap(result.first);
    _currentUser = user;
    return user;
  }

  void logout() {
    _currentUser = null;
  }



}
