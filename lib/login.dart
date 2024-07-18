import 'package:flutter/material.dart';
import 'cadastro_repository.dart';
import 'cadastro_user.dart';
import 'package:cafecomletras/paginaInicial.dart'; // Importe a página inicial aqui, substitua pelo nome correto do arquivo

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repository = CadastroRepository();

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
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do rótulo
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white), // Cor do texto digitado
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do rótulo
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white), // Cor do texto digitado
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a senha';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: Text('Não tem uma conta? Cadastre-se aqui', style: TextStyle(color: Color.fromARGB(255, 7, 160, 243))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[],
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

      if (user != null && user.password == _passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login realizado com sucesso!')),
        );

        // Navegar para a página inicial após o login bem-sucedido
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PaginaInicial(),), // Substitua PaginaInicial pelo nome correto da sua classe
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário ou senha inválidos')),
        );
      }
    }
  }
}
