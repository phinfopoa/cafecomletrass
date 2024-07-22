import 'package:flutter/material.dart';

class SearchBart extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBart({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchBartState createState() => _SearchBartState();
}

class _SearchBartState extends State<SearchBart> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onSearch,
      style: TextStyle(color: Colors.white), // Cor do texto
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black, // Cor de fundo
        hintText: 'Pesquisar livros...',
        hintStyle: TextStyle(color: Colors.grey), // Cor do texto de dica
        prefixIcon:
            Icon(Icons.search, color: Colors.white), // Ícone de pesquisa
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
