import 'package:flutter/material.dart';
import 'package:proj_curso/bookCard.dart';
import 'package:proj_curso/bookData.dart';
import 'package:proj_curso/buttomNavBar.dart';
import 'package:proj_curso/categorias.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

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
        filteredBooks = books.where((book) => book.categorie == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.black, // Cor de fundo preta
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: SearchBar(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  children: [
                    Categorias(onCategorySelected: filterBooks),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
