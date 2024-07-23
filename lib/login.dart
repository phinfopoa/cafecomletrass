import 'package:flutter/material.dart';
import 'package:proj_curso/RedefinirSenhaPage.dart';
import 'cadastro_repository.dart';
import 'cadastro_user.dart';
import 'paginaInicial.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  // Cria um estado para o widget `LoginPage`.
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repository = CadastroRepository();
  // Define chaves e controladores para o formulário, e uma instância do repositório.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network('https://i.postimg.cc/jSm7V9Kn/logo-um.png'),
              Text(
                'Entre na sua conta',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu Email';
                  }
                  return null;
                },
              ),
              // Campo de texto para email com validação.

              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a senha';
                  }
                  return null;
                },
              ),
              // Campo de texto para senha com validação e opção de esconder o texto.

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: Text(
                  'Não tem uma conta? Cadastre-se aqui',
                  style: TextStyle(color: Color.fromARGB(255, 7, 160, 243)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RedefinirSenhaPage(),
                    ),
                  );
                },
                child: Text(
                  'Esqueceu a senha? Redefinir',
                  style: TextStyle(color: Color.fromARGB(255, 7, 160, 243)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      User? user = await _repository.getUser(_emailController.text);
      // Obtém o usuário pelo email fornecido.

      if (user != null && user.password == _passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login realizado com sucesso!')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PaginaInicial()),
        );
        // Se o usuário for encontrado e a senha estiver correta, navega para a página inicial.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário ou senha inválidos')),
        );
        // Exibe uma mensagem de erro se o usuário ou senha estiverem incorretos.
      }
    }
  }
}
