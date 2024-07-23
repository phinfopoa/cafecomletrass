import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'cadastro_repository.dart'; // Importa o repositório de cadastro para interagir com o banco de dados.
import 'cadastro_user.dart'; // Importa a classe `User` que representa um usuário.

class RedefinirSenhaPage extends StatefulWidget {
  @override
  _RedefinirSenhaPageState createState() => _RedefinirSenhaPageState();
}

class _RedefinirSenhaPageState extends State<RedefinirSenhaPage> {
  final _formKey = GlobalKey<
      FormState>(); // Chave global para o formulário para validar e salvar o estado.
  final _emailController =
      TextEditingController(); // Controlador para o campo de email.
  final _newPasswordController =
      TextEditingController(); // Controlador para o campo de nova senha.
  final _repository =
      CadastroRepository(); // Instância do repositório de cadastro para interagir com o banco de dados.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Ícone de seta para voltar.
          onPressed: () {
            Navigator.pop(context); // Volta para a página anterior.
          },
        ),
        title: Text('',
            style: TextStyle(
                color: Colors.white)), // Título da AppBar, vazio neste caso.
        backgroundColor: Colors.black, // Cor de fundo da AppBar.
        iconTheme:
            IconThemeData(color: Colors.white), // Cor dos ícones da AppBar.
      ),
      backgroundColor: Colors.black, // Cor de fundo da página.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding ao redor do conteúdo.
        child: Form(
          key: _formKey, // Define a chave do formulário.
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centraliza o conteúdo verticalmente.
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centraliza o conteúdo horizontalmente.
            children: <Widget>[
              Image.network(
                  'https://i.postimg.cc/jSm7V9Kn/logo-um.png'), // Exibe a imagem de logo.
              SizedBox(height: 20), // Espaço vertical de 20 pixels.
              Text(
                'Redefinir Senha',
                style: TextStyle(
                    color: Colors.white, fontSize: 14), // Estilo do texto.
              ),
              SizedBox(height: 20), // Espaço vertical de 20 pixels.
              TextFormField(
                controller: _emailController, // Controlador do campo de email.
                decoration: InputDecoration(
                  labelText: 'Email', // Texto do rótulo.
                  border: OutlineInputBorder(), // Borda do campo.
                  labelStyle: TextStyle(
                      color: Colors.white), // Estilo do texto do rótulo.
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Cor da borda quando o campo está focado.
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Cor da borda quando o campo está habilitado.
                  ),
                ),
                style: TextStyle(color: Colors.white), // Cor do texto inserido.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu Email'; // Validação para garantir que o campo não esteja vazio.
                  }
                  // Regex para validar o formato do email.
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'O email deve conter "@" e "."'; // Mensagem de erro se o email não estiver no formato correto.
                  }
                  return null; // Retorna null se a validação for bem-sucedida.
                },
              ),
              SizedBox(height: 20), // Espaço vertical de 20 pixels.
              TextFormField(
                controller:
                    _newPasswordController, // Controlador do campo de nova senha.
                decoration: InputDecoration(
                  labelText: 'Nova Senha', // Texto do rótulo.
                  border: OutlineInputBorder(), // Borda do campo.
                  labelStyle: TextStyle(
                      color: Colors.white), // Estilo do texto do rótulo.
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Cor da borda quando o campo está focado.
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Cor da borda quando o campo está habilitado.
                  ),
                ),
                obscureText: true, // Oculta o texto inserido (senha).
                style: TextStyle(color: Colors.white), // Cor do texto inserido.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a nova senha'; // Validação para garantir que o campo não esteja vazio.
                  }
                  // Verifica se a nova senha tem mais de 6 caracteres.
                  if (value.length <= 6) {
                    return 'A nova senha deve ter mais de 6 caracteres'; // Mensagem de erro se a senha for muito curta.
                  }
                  return null; // Retorna null se a validação for bem-sucedida.
                },
              ),
              SizedBox(height: 20), // Espaço vertical de 20 pixels.
              SizedBox(
                width: double
                    .infinity, // Define a largura do botão para preencher a largura disponível.
                child: ElevatedButton(
                  onPressed:
                      _resetPassword, // Função chamada ao pressionar o botão.
                  child: Text('Redefinir'), // Texto do botão.
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 15), // Padding vertical do botão.
                    textStyle: TextStyle(
                        fontSize: 18), // Tamanho da fonte do texto do botão.
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para redefinir a senha.
  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      // Valida o formulário.
      User? user = await _repository.getUser(
          _emailController.text); // Busca o usuário pelo email fornecido.

      if (user != null) {
        // Se o usuário for encontrado.
        user.password =
            _newPasswordController.text; // Atualiza a senha do usuário.
        await _repository
            .updateUser(user); // Atualiza o usuário no banco de dados.

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Senha redefinida com sucesso!')), // Exibe uma mensagem de sucesso.
        );

        Navigator.pop(context); // Volta para a página anterior.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Email não encontrado')), // Exibe uma mensagem de erro se o email não for encontrado.
        );
      }
    }
  }
}
