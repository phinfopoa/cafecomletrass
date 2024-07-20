import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categorias extends StatefulWidget {
  final Function(String) onCategorySelected;

  Categorias({required this.onCategorySelected});

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  List<bool> isSelected = [true, false, false, false];

  final List<String> categories = ['Todos', 'Aventura', 'Terror', 'Romance'];

  @override
  Widget build(BuildContext context) {
    // Obter a largura da tela
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        selectedBorderColor: Color.fromARGB(255, 90, 90, 109),
        selectedColor: Color.fromARGB(255, 255, 255, 255),
        fillColor: const Color.fromARGB(255, 21, 22, 22),
        color: Color.fromARGB(179, 240, 235, 235),
        constraints: BoxConstraints(
          minHeight: 40.0,
          // Calcular a largura mínima do botão para ocupar a tela inteira
          minWidth: screenWidth / isSelected.length -1.3,
        ),
        isSelected: isSelected,
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
            widget.onCategorySelected(categories[index]);
          });
        },
        children: categories.map((category) => Text(category)).toList(),
      ),
    );
  }
}
