import 'package:flutter/material.dart';
import 'package:proj_curso/NavigationProvider.dart';
import 'package:provider/provider.dart';
import 'paginaInicial.dart';
import 'reservas_page.dart';
import 'notifications_page.dart';
import 'search_page.dart';
import 'reservas_provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final hasUnreadNotifications =
        Provider.of<ReservasProvider>(context).hasUnreadNotifications;
    // Obtém os provedores de navegação e reservas.

    return Theme(
      data: ThemeData(
        canvasColor: Colors.black,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.grey),
        ),
      ),
      // Define o tema da barra de navegação .

      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: navigationProvider.selectedIndex,
        onTap: (index) {
          navigationProvider.setIndex(index); // Atualiza o índice selecionado.
          _onItemTapped(context, index);
        },
        // Configura a aparência e o comportamento da barra de navegação inferior.

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            tooltip: 'Página Inicial',
          ),
          // Item para a página inicial.

          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Ícone de pesquisa.
            label: 'Buscar',
            tooltip: 'Buscar Livros',
          ),
          // Item  para a página de busca.

          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.notifications),
                if (hasUnreadNotifications)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Notificações',
            tooltip: 'Notificações',
          ),
          // Item  para a página de notificações, com indicador de novas notificações.

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Reservas',
            tooltip: 'Reservas',
          ),
          // Item para a página de reservas.
        ],
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PaginaInicial()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NotificationsPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ReservasPage()),
        );
        break;
    }
  }
  // Método que navega para diferentes páginas com base no índice selecionado na barra de navegação.
}
