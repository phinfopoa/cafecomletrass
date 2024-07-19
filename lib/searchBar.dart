import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white), // Cor do texto digitado
      decoration: InputDecoration(
        hintText: 'Pesquisar livros',
        hintStyle: TextStyle(color: Colors.white70), // Cor do texto de dica
        prefixIcon: Icon(Icons.search, color: Colors.white), // Cor do ícone
        filled: true,
        fillColor: Colors.black, // Cor de fundo preta
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
