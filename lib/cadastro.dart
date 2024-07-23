import 'package:flutter/material.dart';
import 'cadastro_repository.dart';
import 'cadastro_user.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
  // Cria um estado para o widget `CadastroPage`.
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repository = CadastroRepository();
  // Define chaves e controladores para o formulário, e uma instância do repositório.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cadastro', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://i.postimg.cc/jSm7V9Kn/logo-um.png',
                    height: 100,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o seu email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'O email deve conter "@" e "."';
                      }
                      return null;
                      // Valida o campo de email e verifica o formato usando Regex.
                    },
                  ),
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a senha';
                      }
                      if (value.length <= 6) {
                        return 'A senha deve ter mais de 6 caracteres';
                      }
                      return null;
                      // Valida o campo de senha e verifica se tem mais de 6 caracteres.
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: _register,
                      child: Text('Cadastrar'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      User? existingUser = await _repository.getUser(_emailController.text);
      if (existingUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email já cadastrado')),
        );
        // Verifica se o email já está cadastrado.
      } else {
        User newUser = User(
          username: _emailController.text,
          password: _passwordController.text,
        );

        await _repository.insertUser(newUser);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário cadastrado com sucesso!')),
        );

        _emailController.clear();
        _passwordController.clear();
        // Cadastra o novo usuário e exibe uma mensagem de sucesso.
      }
    }
  }
}
