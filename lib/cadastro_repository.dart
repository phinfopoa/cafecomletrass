import 'cadastro_user.dart';
import 'db_helper.dart';

class CadastroRepository {
  // Classe responsável pela comunicação com o banco de dados para operações relacionadas aos usuários.

  Future<int> insertUser(User user) async {
    final db = await DBHelper().database;
    // Obtém a instância do banco de dados.

    return await db.insert('users', user.toMap());
    // Insere o usuário na tabela 'users' e retorna o ID do novo registro.
  }

  Future<User?> getUser(String username) async {
    final db = await DBHelper().database;
    // Obtém a instância do banco de dados.

    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    // Consulta o banco de dados para encontrar um usuário com o nome de usuário fornecido.

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
      // Se encontrar um usuário, retorna o objeto `User` correspondente.
    }
    return null;
    // Se não encontrar, retorna null.
  }

  Future<int> updateUser(User user) async {
    final db = await DBHelper().database;
    // Obtém a instância do banco de dados.

    return await db.update(
      'users',
      {
        'password': user.password,
      },
      where: 'username = ?',
      whereArgs: [user.username],
    );
    // Atualiza a senha do usuário na tabela 'users' e retorna o número de linhas afetadas.
  }
}
