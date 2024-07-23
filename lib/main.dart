import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'package:provider/provider.dart'; // Importa o pacote Provider para gerenciar o estado.
import 'package:proj_curso/NavigationProvider.dart'; // Importa o NavigationProvider para gerenciar a navegação.
import 'paginaInicial.dart'; // Importa a página inicial do aplicativo.
import 'login.dart'; // Importa a página de login.
import 'cadastro.dart'; // Importa a página de cadastro.
import 'reservas_page.dart'; // Importa a página de reservas.
import 'notifications_page.dart'; // Importa a página de notificações.
import 'search_page.dart'; // Importa a página de pesquisa.
import 'reservas_provider.dart'; // Importa o provider de reservas.

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ReservasProvider()), // Cria e fornece o ReservasProvider para o aplicativo.
        ChangeNotifierProvider(
            create: (context) =>
                NavigationProvider()), // Cria e fornece o NavigationProvider para o aplicativo.
      ],
      child: MyApp(), // Inicia o aplicativo com o widget MyApp.
    ),
  );
  // Inicializa o aplicativo e fornece os provedores necessários.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café com Letras', // Define o título do aplicativo.
      initialRoute: '/', // Define a rota inicial do aplicativo.
      routes: {
        '/': (context) => LoginPage(), // Define a rota para a página de login.
        '/cadastro': (context) =>
            CadastroPage(), // Define a rota para a página de cadastro.
        '/paginainicial': (context) =>
            PaginaInicial(), // Define a rota para a página inicial.
        '/reservas': (context) =>
            ReservasPage(), // Define a rota para a página de reservas.
        '/notificacoes': (context) =>
            NotificationsPage(), // Define a rota para a página de notificações.
        '/search': (context) =>
            SearchPage(), // Define a rota para a página de pesquisa.
      },
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define a cor principal do tema do aplicativo.
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // Ajusta a densidade visual para se adaptar à plataforma.
      ),
      // Define o tema e as rotas do aplicativo.
    );
  }
}
