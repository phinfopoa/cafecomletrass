import 'package:flutter/material.dart'; // Importa o pacote principal do Flutter para criar interfaces de usuário.
import 'package:proj_curso/bookData.dart';
import 'package:provider/provider.dart'; // Importa o pacote Provider para gerenciar o estado no aplicativo.
import 'reservas_provider.dart'; // Importa o arquivo 'reservas_provider.dart', onde está definida a classe 'ReservasProvider'.

class BookDetailsPage extends StatelessWidget {
  // Define uma página de detalhes do livro

  final String title;
  final String author;
  final String imagePath;
  final String categorie;
  final String synopsis;
  // Declara as propriedades da página de detalhes do livro.

  const BookDetailsPage({
    Key? key,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.categorie,
    required this.synopsis,
  }) : super(key: key);
  // Construtor para valores obrigatórios.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Define a cor de fundo da página como preta.

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // botão de voltar na barra de app que fecha a página de detalhes ao ser pressionado.

        title: const Text('Detalhe', style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.black,
        elevation: 0,
        // Define o título, a cor de fundo e remove a sombra da barra de app.
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            //  imagem do livro no centro da página.

            const SizedBox(height: 20),
            // Adiciona um espaço  de 20 pixels.

            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // título do livro.

            Text(
              author,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            // autor do livro.

            const SizedBox(height: 10),
            // Adiciona um espaço  de 10 pixels.

            Row(
              children: categorie.split(', ').map((genre) {
                return Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    genre,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
            // Divide as categorias em uma lista e exibe cada uma em um contêiner

            const SizedBox(height: 20),
            // Adiciona um espaço  de 20 pixels.

            Text(
              synopsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            // Exibe a sinopse do livro.

            const SizedBox(height: 20),
            // Adiciona um espaço de 20 pixels.

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    final reservasProvider =
                        Provider.of<ReservasProvider>(context, listen: false);
                    final book = Book(
                      title: title,
                      author: author,
                      imagePath: imagePath,
                      categorie: categorie,
                      synopsis: synopsis,
                    );
                    final message = reservasProvider.adicionarReserva(book);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Reserva'),
                          content: Text(message),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.bookmark_add),
                  label: const Text('Reservar'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                // Botão para reservar o livro, que exibe um diálogo de confirmação ao ser pressionado.

                const SizedBox(width: 16),
                // Adiciona um espaço  de 16 pixels.

                ElevatedButton.icon(
                  onPressed: () {
                    final reservasProvider =
                        Provider.of<ReservasProvider>(context, listen: false);
                    final book = Book(
                      title: title,
                      author: author,
                      imagePath: imagePath,
                      categorie: categorie,
                      synopsis: synopsis,
                    );
                    reservasProvider.adicionarFavorito(book);

                    // Exibir um SnackBar para informar o usuário
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Você favoritou este livro!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.favorite_border),
                  label: const Text('Favoritar'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                // Botão para favoritar o livro, que exibe um SnackBar ao ser pressionado.
              ],
            ),
            const SizedBox(height: 20),
            // Adiciona um espaço  de 20 pixels.
          ],
        ),
      ),
    );
  }
}
