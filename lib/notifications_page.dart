import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'package:provider/provider.dart'; // Importa o pacote Provider para gerenciar o estado do aplicativo.
import 'reservas_provider.dart'; // Importa o arquivo onde está definido o `ReservasProvider`.
import 'buttomNavBar.dart'; // Importa o arquivo que contém o widget `BottomNavBar`.

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    // Adiciona uma função para ser executada após o primeiro quadro de construção do widget.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Obtém o `ReservasProvider` sem ouvir mudanças e marca as notificações como lidas.
      Provider.of<ReservasProvider>(context, listen: false)
          .markNotificationsAsRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtém a lista de notificações do `ReservasProvider`.
    final notifications = Provider.of<ReservasProvider>(context).notifications;

    return Scaffold(
      backgroundColor:
          Colors.black, // Define a cor de fundo da tela como preta.
      appBar: AppBar(
        title: const Text('Notificações',
            style: TextStyle(
                color: Colors
                    .white)), // Define o título da barra de aplicativos com texto branco.
        backgroundColor: Colors
            .black, // Define a cor de fundo da barra de aplicativos como preta.
        elevation: 0, // Remove a sombra da barra de aplicativos.
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text('Nenhuma notificação',
                  style: TextStyle(
                      color: Colors
                          .white)), // Exibe uma mensagem informando que não há notificações.
            )
          : ListView.builder(
              itemCount: notifications
                  .length, // Define o número de itens na lista como o comprimento da lista de notificações.
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[850], // Define a cor de fundo do cartão.
                  margin: const EdgeInsets.all(
                      10.0), // Define a margem ao redor do cartão.
                  child: ListTile(
                    title: Text(notifications[index],
                        style: TextStyle(
                            color: Colors
                                .white)), // Define o texto do item como a notificação no índice atual com texto branco.
                    leading: Icon(Icons.notifications,
                        color: Colors
                            .white), // Adiciona um ícone de notificação à esquerda do texto.
                  ),
                );
              },
            ),
      bottomNavigationBar:
          BottomNavBar(), // Adiciona um widget de barra de navegação inferior à tela.
    );
  }
}
