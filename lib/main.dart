
import 'package:flutter/material.dart';
import 'package:proj_curso/paginaInicial.dart';
import 'login.dart';
import 'cadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café com Letras',
      
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/paginainicial': (context) => PaginaInicial(),
      },
    );
  }
}
