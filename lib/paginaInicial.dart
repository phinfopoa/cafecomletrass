import 'package:flutter/material.dart';
import 'package:proj_curso/bookCard.dart';
import 'package:proj_curso/bookData.dart';
import 'package:proj_curso/buttomNavBar.dart';

import 'categorias.dart'; // Importe o Categorias

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  String selectedCategory = 'Todos';
  List<Book> filteredBooks = books;

  void filterBooks(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'Todos') {
        filteredBooks = books;
      } else {
        filteredBooks =
            books.where((book) => book.categorie == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Adiciona a barra de pesquisa
            Container(
              width: double.infinity,
              child: SearchBar(),
            ),
            SizedBox(height: 20),
            // Adiciona os botões de categorias
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Categorias(onCategorySelected: filterBooks),
            ),
            SizedBox(height: 10),
            // Adiciona a lista de livros filtrados
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: filteredBooks.length,
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];
                  return BookCard(
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
          BottomNavBar(), // Adiciona o BottomNavBar sem parâmetros
    );
  }
}
