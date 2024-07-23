import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'package:proj_curso/bookCard.dart'; // Importa a definição do widget BookCard.
import 'package:proj_curso/bookData.dart'; // Importa a definição da lista de livros e da classe Book.
import 'package:proj_curso/searchBar.dart'; // Importa a definição do widget SearchBar.
import 'buttomNavBar.dart'; // Importa o widget BottomNavBar.

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Lista de livros filtrados que será exibida na interface.
  List<Book> filteredBooks = books;
  // Lista completa de livros disponível para pesquisa.
  List<Book> allBooks = books;

  // Função para buscar livros com base em uma consulta.
  void searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        // Se a consulta estiver vazia, exibe todos os livros.
        filteredBooks = allBooks;
      } else {
        // Filtra a lista de livros com base na consulta.
        filteredBooks = allBooks
            .where((book) =>
                book.title.toLowerCase().contains(query.toLowerCase()) ||
                book.author.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Define a cor de fundo da página.

      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Define o padding ao redor do conteúdo.
        child: Column(
          children: [
            SizedBox(height: 20), // Espaçamento acima da barra de pesquisa.
            SearchBart(onSearch: searchBooks), // Adiciona a barra de pesquisa.
            SizedBox(height: 10), // Espaçamento abaixo da barra de pesquisa.
            Expanded(
              // Expande o GridView para preencher o espaço disponível.
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // Configura o layout da grade de livros.
                  crossAxisCount: 1, // Número de colunas na grade.
                  crossAxisSpacing:
                      8, // Espaçamento horizontal entre os itens da grade.
                  mainAxisSpacing:
                      8, // Espaçamento vertical entre os itens da grade.
                  childAspectRatio:
                      3 / 2, // Proporção do tamanho dos itens na grade.
                ),
                itemCount: filteredBooks.length, // Número de itens na grade.
                itemBuilder: (context, index) {
                  final book = filteredBooks[
                      index]; // Obtém o livro para o índice atual.
                  return BookCard(
                    // Cria um cartão para exibir as informações do livro.
                    title: book.title,
                    author: book.author,
                    imagePath: book.imagePath,
                    categorie: book.categorie,
                    synopsis: book.synopsis,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavBar(), // Adiciona o BottomNavBar à parte inferior da página.
    );
  }
}
