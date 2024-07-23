import 'package:flutter/material.dart';
import 'book_details_page.dart'; // Importa a página de detalhes do livro.

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;
  final String categorie;
  final String synopsis;
  //  propriedades do card  livro.

  const BookCard({
    Key? key,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.categorie,
    required this.synopsis,
  }) : super(key: key);
  // Construtor  com valores obrigatórios.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsPage(
              title: title,
              author: author,
              imagePath: imagePath,
              categorie: categorie,
              synopsis: synopsis, // sinopse real
            ),
          ),
        );
      },
      // Define um GestureDetector para detectar toques no cartão e navegar para a página de detalhes do livro.

      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        // Define a aparência do cartão com elevação e bordas arredondadas.

        child: Stack(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // imagem do livro que cobre todo o cartão.

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Adiciona um gradiente preto transparente na parte inferior do card para melhorar a legibilidade do texto.

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Exibe o título do livro.

                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  // Exibe o autor do livro.

                  Text(
                    categorie,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  // Exibe a categoria do livro.
                ],
              ),
            ),
            // Adiciona o texto do título, autor e categoria na parte inferior do cartão.
          ],
        ),
      ),
    );
  }
}
