class User {
  int? id;
  String username;
  String password;
  // Define a classe 'User' com propriedades para ID, nome de usuário e senha.

  User({this.id, required this.username, required this.password});
  // Construtor com valores obrigatórios, com ID opcional.

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'username': username,
      'password': password,
    };
    // Cria um mapa com os valores de nome de usuário e senha.

    if (id != null) {
      map['id'] = id;
      // Adiciona o ID ao mapa apenas se estiver presente.
    }
    return map;
    // Retorna o mapa com os dados do usuário.
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
    // Cria uma instância de 'User' a partir de um mapa.
  }
}
