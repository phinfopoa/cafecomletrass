import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'package:proj_curso/bookCard.dart'; // Importa o widget `BookCard` para exibir informações sobre livros.
import 'package:proj_curso/bookData.dart'; // Importa dados de livros e a lista `books`.
import 'package:proj_curso/buttomNavBar.dart'; // Importa o widget `BottomNavBar` para a barra de navegação inferior.
import 'package:proj_curso/searchBar.dart'; // Importa o widget `SearchBart` para a barra de pesquisa.
import 'categorias.dart'; // Importa o widget `Categorias` para selecionar categorias de livros.

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String selectedCategory =
      'Todos'; // Armazena a categoria atualmente selecionada.
  List<Book> filteredBooks =
      books; // Lista de livros filtrados, inicialmente todos os livros.
  List<Book> allBooks = books; // Lista de todos os livros.

  // Filtra os livros com base na categoria selecionada.
  void filterBooks(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'Todos') {
        filteredBooks =
            allBooks; // Exibe todos os livros se a categoria for 'Todos'.
      } else {
        filteredBooks = allBooks
            .where((book) => book.categorie == category)
            .toList(); // Filtra os livros pela categoria selecionada.
      }
    });
  }

  // Filtra os livros com base na consulta de pesquisa.
  void searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBooks =
            allBooks; // Exibe todos os livros se a consulta estiver vazia.
      } else {
        filteredBooks = allBooks
            .where((book) =>
                book.title.toLowerCase().contains(query
                    .toLowerCase()) || // Verifica se o título do livro contém a consulta.
                book.author.toLowerCase().contains(query
                    .toLowerCase())) // Verifica se o autor do livro contém a consulta.
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Define a cor de fundo da tela como preta.
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Define o padding ao redor do conteúdo.
        child: Column(
          children: [
            SizedBox(height: 20), // Adiciona um espaço vertical de 20 pixels.
            // Adiciona a barra de pesquisa.
            Container(
              width: double
                  .infinity, // Define a largura do container para preencher a largura disponível.
              child: SearchBart(
                  onSearch:
                      searchBooks), // Adiciona o widget `SearchBart` e passa a função de pesquisa.
            ),
            SizedBox(height: 20), // Adiciona um espaço vertical de 20 pixels.
            // Adiciona os botões de categorias.
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:
                      8.0), // Define o padding horizontal ao redor dos botões de categoria.
              child: Categorias(
                  onCategorySelected:
                      filterBooks), // Adiciona o widget `Categorias` e passa a função de filtragem.
            ),
            SizedBox(height: 10), // Adiciona um espaço vertical de 10 pixels.
            // Adiciona a lista de livros filtrados.
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Define o número de colunas como 1.
                  crossAxisSpacing:
                      8, // Define o espaçamento entre as colunas como 8 pixels.
                  mainAxisSpacing:
                      8, // Define o espaçamento entre as linhas como 8 pixels.
                  childAspectRatio: 3 /
                      2, // Define a proporção do aspecto dos itens como 3:2.
                ),
                itemCount: filteredBooks
                    .length, // Define o número de itens na grade como o comprimento da lista de livros filtrados.
                itemBuilder: (context, index) {
                  final book =
                      filteredBooks[index]; // Obtém o livro no índice atual.
                  return BookCard(
                    title: book.title, // Define o título do livro.
                    author: book.author, // Define o autor do livro.
                    imagePath:
                        book.imagePath, // Define o caminho da imagem do livro.
                    categorie: book.categorie, // Define a categoria do livro.
                    synopsis: book.synopsis, // Define a sinopse do livro.
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavBar(), // Adiciona um widget de barra de navegação inferior à tela.
    );
  }
}
