import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'paginaInicial.dart';
import 'login.dart';
import 'cadastro.dart';
import 'reservas_page.dart';
import 'notifications_page.dart';
import 'reservas_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReservasProvider(),
      child: MyApp(),
    ),
  );
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
        '/reservas': (context) => ReservasPage(),
        '/notificacoes': (context) => NotificationsPage(),
      },
    );
  }
}
