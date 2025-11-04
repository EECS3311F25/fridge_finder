import '../models/fridge.dart';
import '../models/item.dart';
import '../models/user.dart';


class LoginController {
  
  //final UserDatabaseHelper _dbHelper = UserDatabaseHelper.instance;
    /*
  /// Logs in a user by verifying username and password in the database.
  /// Returns the [User] object if valid, otherwise throws an exception.
  Future<User> login(String username, String password) async {
    final db = await _dbHelper.db;

    // Query the database for a matching username & password
    final result = await db.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );

    if (result.isEmpty) {
      throw Exception('Invalid username or password');
    }

    // Convert the map to a User object
    return User.fromMap(result.first);
  }

   //Only uncomment if needed in future for registering or get list of users.
  void createUser(String username, String password) {
    final user = User(
      username: username,
      email: '$username@example.com',
      password: password,
    );

    _users.add(user);

    // await UserDatabaseHelper.instance.insertUser(user);
  }
  
  /// Example utility to get all registered users.
  List<User> getAllUsers() => List.unmodifiable(_users);
  */
}
