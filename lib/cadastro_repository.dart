import 'cadastro_user.dart';
import 'db_helper.dart';

class CadastroRepository {
  Future<int> insertUser(User user) async {
    final db = await DBHelper().database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUser(String username) async {
    final db = await DBHelper().database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
