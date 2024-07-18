import 'bookCard.dart';
import 'bookData.dart';
import 'buttomNavBar.dart';
import 'categorias.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Definindo a cor de fundo do body como preta
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20), // Espaçamento acima do SearchBar
            Container(
              width: double.infinity,
              child: SearchBar(),
            ),
            SizedBox(height: 20), // Espaçamento abaixo do SearchBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Wrap(
                children: [
                  Categorias(), // Este widget será movido para a linha seguinte se necessário
                ],
              ),
            ),
            SizedBox(height: 10), // Espaçamento abaixo das Categorias
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Apenas uma coluna
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio:
                      3 / 2, // Proporção ajustada para ocupar a largura
                ),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
