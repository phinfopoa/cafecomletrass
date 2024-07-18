import 'package:cafecomletras/bookCard.dart';
import 'package:cafecomletras/bookData.dart';
import 'package:cafecomletras/buttomNavBar.dart';
import 'package:cafecomletras/categorias.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            backgroundColor: Colors.black, // Definindo a cor de fundo do body como preta

      body: Column(
        children: [
          SearchBar(),
          Row(
            children: [Categorias()],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Apenas uma coluna
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 2, // Proporção ajustada para ocupar a largura
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
          ),
          
        ],
          ),
           bottomNavigationBar: BottomNavBar(),
    
    );
  }
}

