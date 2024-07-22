import 'package:flutter/material.dart';
import 'package:proj_curso/bookCard.dart';
import 'package:proj_curso/bookData.dart';
import 'package:proj_curso/searchBar.dart';
import 'buttomNavBar.dart'; // Importe o BottomNavBar

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> filteredBooks = books;
  List<Book> allBooks = books;

  void searchBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredBooks = allBooks;
      } else {
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
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            SearchBart(onSearch: searchBooks),
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
                    synopsis: book.synopsis,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(), // Adiciona o BottomNavBar
    );
  }
}
