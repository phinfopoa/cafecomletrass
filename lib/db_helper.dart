import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();
  // Singleton para garantir que apenas uma instância do DBHelper seja criada.

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
    // Retorna a instância do banco de dados, inicializando-a se necessário.
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'cadastro.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    // Inicializa o banco de dados, criando-o se necessário.
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
    // Cria a tabela 'users' no banco de dados.
  }
}
