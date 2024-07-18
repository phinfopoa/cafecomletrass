import 'package:flutter/material.dart';
import 'cadastro_repository.dart';
import 'cadastro_user.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
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
              Image.network('https://i.postimg.cc/jSm7V9Kn/logo-um.png',),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
               
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
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
    }
  }
}
