import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categorias extends StatefulWidget {
  final Function(String) onCategorySelected;

  Categorias({required this.onCategorySelected});
  // Construtor que recebe uma função callback que será chamada quando uma categoria for selecionada.

  @override
  _CategoriasState createState() => _CategoriasState();
  // Cria um estado para o widget `Categorias`.
}

class _CategoriasState extends State<Categorias> {
  List<bool> isSelected = [true, false, false, false];
  // Lista para controlar quais botões estão selecionados.

  final List<String> categories = ['Todos', 'Aventura', 'Terror', 'Romance'];
  // Lista de categorias disponíveis.

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Obtém a largura da tela.

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        selectedBorderColor: Color.fromARGB(255, 90, 90, 109),
        selectedColor: Color.fromARGB(255, 255, 255, 255),
        fillColor: const Color.fromARGB(255, 21, 22, 22),
        color: Color.fromARGB(179, 240, 235, 235),
        constraints: BoxConstraints(
          minHeight: 40.0,
          minWidth: screenWidth / isSelected.length - 1.3,
          // Calcula a largura mínima do botão para ocupar a tela inteira.
        ),
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
            widget.onCategorySelected(categories[index]);
            // Atualiza a lista `isSelected` e chama a função callback com a categoria selecionada.
          });
        },
        children: categories.map((category) => Text(category)).toList(),
        // Mapeia a lista de categorias para criar uma lista de widgets `Text`.
      ),
    );
  }
}
