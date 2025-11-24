import '../models/user.dart';

class RegisterController {
  Future<User> createUser(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password cannot be empty');
    }
    final email = username;
    final newUser = await User.createAndInsert(username, email, password);
    return newUser;
  }
}
