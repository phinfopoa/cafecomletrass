import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.

class SearchBart extends StatefulWidget {
  // Função callback que será chamada sempre que o texto de pesquisa mudar.
  final Function(String) onSearch;

  // Construtor da classe SearchBart que requer a função onSearch.
  const SearchBart({Key? key, required this.onSearch}) : super(key: key);

  @override
  _SearchBartState createState() => _SearchBartState();
}

class _SearchBartState extends State<SearchBart> {
  late TextEditingController
      _controller; // Controlador para o TextField de pesquisa.

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); // Inicializa o controlador.
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller, // Associa o controlador ao TextField.
      onChanged:
          widget.onSearch, // Chama a função onSearch sempre que o texto mudar.
      style: TextStyle(
          color: Colors.white), // Define a cor do texto no campo de pesquisa.
      decoration: InputDecoration(
        filled:
            true, // Indica que o campo de texto será preenchido com uma cor de fundo.
        fillColor: Colors.black, // Define a cor de fundo do campo de pesquisa.
        hintText:
            'Pesquisar livros...', // Texto de dica exibido quando o campo está vazio.
        hintStyle:
            TextStyle(color: Colors.grey), // Define a cor do texto de dica.
        prefixIcon: Icon(Icons.search,
            color:
                Colors.white), // Ícone de pesquisa exibido no início do campo.
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Define o raio das bordas do campo.
          borderSide:
              BorderSide.none, // Remove a borda padrão do campo de texto.
        ),
      ),
    );
  }
}
