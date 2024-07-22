import 'package:flutter/material.dart';
import 'package:proj_curso/NavigationProvider.dart';
import 'package:provider/provider.dart';
import 'paginaInicial.dart';
import 'login.dart';
import 'cadastro.dart';
import 'reservas_page.dart';
import 'notifications_page.dart';
import 'search_page.dart'; // Importe a nova página de pesquisa
import 'reservas_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReservasProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                NavigationProvider()), // Adicione o NavigationProvider
      ],
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
        '/search': (context) =>
            SearchPage(), // Adicione a nova rota para a página de pesquisa
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
