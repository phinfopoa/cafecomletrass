import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'package:provider/provider.dart'; // Importa o pacote Provider para gerenciar o estado.
import 'reservas_provider.dart'; // Importa o provedor de reservas para gerenciar reservas e favoritos.
import 'buttomNavBar.dart'; // Importa a barra de navegação inferior.

class ReservasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém o provedor de reservas do contexto.
    final reservasProvider = Provider.of<ReservasProvider>(context);
    // Obtém a lista de reservas e favoritos do provedor.
    final reservas = reservasProvider.reservas;
    final favoritos = reservasProvider.favoritos;

    return Scaffold(
      backgroundColor: Colors.black, // Define a cor de fundo da página.
      appBar: AppBar(
        title: Text('',
            style: TextStyle(
                color: Colors.white)), // Título da AppBar, vazio neste caso.
        backgroundColor: Colors.black, // Cor de fundo da AppBar.
        elevation: 0, // Remove a sombra da AppBar.
      ),
      body: SingleChildScrollView(
        // Permite rolar o conteúdo quando necessário.
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0), // Espaçamento vertical.
              child: Text('Reservas',
                  style: TextStyle(
                      fontSize: 24, color: Colors.white)), // Título "Reservas".
            ),
            reservas.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Espaçamento ao redor do texto.
                      child: Text(
                        'Nenhuma reserva',
                        style: TextStyle(
                            color: Colors
                                .white), // Texto indicando que não há reservas.
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap:
                        true, // Ajusta o tamanho do ListView para o conteúdo.
                    physics:
                        NeverScrollableScrollPhysics(), // Desativa a rolagem do ListView.
                    itemCount: reservas
                        .length, // Número de itens na lista de reservas.
                    itemBuilder: (context, index) {
                      final book =
                          reservas[index]; // Obtém o livro na posição atual.
                      return Card(
                        color: Colors.grey[850], // Cor de fundo do cartão.
                        margin: const EdgeInsets.all(
                            10.0), // Margem ao redor do cartão.
                        child: ListTile(
                          leading: Image.asset(book.imagePath,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover), // Imagem do livro.
                          title: Text(book.title,
                              style: TextStyle(
                                  color: Colors.white)), // Título do livro.
                          subtitle: Text(book.author,
                              style: TextStyle(
                                  color: Colors.grey)), // Autor do livro.
                          trailing: ElevatedButton(
                            onPressed: () {
                              reservasProvider.removerReserva(
                                  book); // Remove a reserva ao pressionar o botão.
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Colors.red, // Cor de fundo do botão.
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Borda arredondada do botão.
                              ),
                            ),
                            child: Text('Devolver'), // Texto do botão.
                          ),
                        ),
                      );
                    },
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0), // Espaçamento vertical.
              child: Text('Favoritos',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white)), // Título "Favoritos".
            ),
            favoritos.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Espaçamento ao redor do texto.
                      child: Text(
                        'Nenhum favorito',
                        style: TextStyle(
                            color: Colors
                                .white), // Texto indicando que não há favoritos.
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap:
                        true, // Ajusta o tamanho do ListView para o conteúdo.
                    physics:
                        NeverScrollableScrollPhysics(), // Desativa a rolagem do ListView.
                    itemCount: favoritos
                        .length, // Número de itens na lista de favoritos.
                    itemBuilder: (context, index) {
                      final book =
                          favoritos[index]; // Obtém o livro na posição atual.
                      return Card(
                        color: Colors.grey[850], // Cor de fundo do cartão.
                        margin: const EdgeInsets.all(
                            10.0), // Margem ao redor do cartão.
                        child: ListTile(
                          leading: Image.asset(book.imagePath,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover), // Imagem do livro.
                          title: Text(book.title,
                              style: TextStyle(
                                  color: Colors.white)), // Título do livro.
                          subtitle: Text(book.author,
                              style: TextStyle(
                                  color: Colors.grey)), // Autor do livro.
                          trailing: ElevatedButton(
                            onPressed: () {
                              reservasProvider.removerFavorito(
                                  book); // Remove o favorito ao pressionar o botão.
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Colors.red, // Cor de fundo do botão.
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Borda arredondada do botão.
                              ),
                            ),
                            child: Text('Remover'), // Texto do botão.
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavBar(), // Adiciona a barra de navegação inferior.
    );
  }
}
