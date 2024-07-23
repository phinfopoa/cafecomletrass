import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para utilizar widgets e funcionalidades básicas.

class NavigationProvider with ChangeNotifier {
  // Define uma classe `NavigationProvider` que usa `ChangeNotifier` para gerenciar estado e notificar ouvintes.
  int _selectedIndex =
      0; // Declara uma variável privada `_selectedIndex` para armazenar o índice da aba selecionada, inicializada como 0.

  int get selectedIndex =>
      _selectedIndex; // Define um getter `selectedIndex` para acessar o valor atual de `_selectedIndex`.

  void setIndex(int index) {
    // Define um método `setIndex` que atualiza o índice selecionado.
    _selectedIndex =
        index; // Atualiza a variável privada `_selectedIndex` com o novo índice.
    notifyListeners(); // Notifica todos os ouvintes (widgets) que o valor de `_selectedIndex` mudou, para que eles possam se atualizar.
  }
}
