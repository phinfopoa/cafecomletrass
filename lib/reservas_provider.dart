import 'package:flutter/material.dart'; // Importa o pacote Flutter Material para usar widgets e funcionalidades básicas.
import 'bookData.dart'; // Importa a definição da classe Book.

class ReservasProvider with ChangeNotifier {
  // Lista privada de reservas.
  final List<Book> _reservas = [];
  // Lista privada de favoritos.
  final List<Book> _favoritos = [];
  // Lista privada de notificações.
  final List<String> _notifications = [];
  // Flag para indicar se há notificações não lidas.
  bool _hasUnreadNotifications = false;
  // Número máximo de reservas permitidas.
  static const int maxReservas = 2;

  // Propriedade pública para acessar a lista de reservas.
  List<Book> get reservas => _reservas;
  // Propriedade pública para acessar a lista de favoritos.
  List<Book> get favoritos => _favoritos;
  // Propriedade pública para acessar a lista de notificações.
  List<String> get notifications => _notifications;
  // Propriedade pública para verificar se há notificações não lidas.
  bool get hasUnreadNotifications => _hasUnreadNotifications;

  // Método para adicionar um livro à lista de reservas.
  String adicionarReserva(Book book) {
    // Verifica se o livro já está reservado.
    if (_reservas
        .any((b) => b.title == book.title && b.author == book.author)) {
      return "Este livro já está reservado.";
    }

    // Verifica se o número máximo de reservas foi atingido.
    if (_reservas.length >= maxReservas) {
      return "Você só pode reservar até $maxReservas livros.";
    }

    // Adiciona o livro à lista de reservas.
    _reservas.add(book);
    // Adiciona uma notificação sobre a nova reserva.
    _addNotification("Você reservou: ${book.title} por ${book.author}");
    // Notifica os listeners sobre a mudança de estado.
    notifyListeners();
    return "Livro reservado com sucesso.";
  }

  // Método para remover um livro da lista de reservas.
  void removerReserva(Book book) {
    // Remove o livro da lista de reservas.
    _reservas.remove(book);
    // Adiciona uma notificação sobre a devolução do livro.
    _addNotification("Você devolveu: ${book.title} por ${book.author}");
    // Notifica os listeners sobre a mudança de estado.
    notifyListeners();
  }

  // Método para adicionar um livro à lista de favoritos.
  void adicionarFavorito(Book book) {
    // Verifica se o livro já está na lista de favoritos.
    if (_favoritos
        .any((b) => b.title == book.title && b.author == book.author)) {
      return;
    }

    // Adiciona o livro à lista de favoritos.
    _favoritos.add(book);
    // Adiciona uma notificação sobre o livro adicionado aos favoritos.
    _addNotification(
        "Você adicionou aos favoritos: ${book.title} por ${book.author}");
    // Notifica os listeners sobre a mudança de estado.
    notifyListeners();
  }

  // Método para remover um livro da lista de favoritos.
  void removerFavorito(Book book) {
    // Remove o livro da lista de favoritos.
    _favoritos.remove(book);
    // Adiciona uma notificação sobre o livro removido dos favoritos.
    _addNotification(
        "Você removeu dos favoritos: ${book.title} por ${book.author}");
    // Notifica os listeners sobre a mudança de estado.
    notifyListeners();
  }

  // Método privado para adicionar uma notificação.
  void _addNotification(String message) {
    // Obtém a data e hora atual.
    final now = DateTime.now();
    // Formata a data e hora.
    final formattedDate =
        "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
    // Adiciona a mensagem à lista de notificações.
    _notifications.add("[$formattedDate] $message");
    // Define a flag de notificações não lidas como verdadeira.
    _hasUnreadNotifications = true;
    // Notifica os listeners sobre a mudança de estado.
    notifyListeners();
  }

  // Método para marcar todas as notificações como lidas.
  void markNotificationsAsRead() {
    // Define a flag de notificações não lidas como falsa.
    _hasUnreadNotifications = false;
    // Notifica os listeners sobre a mudança de estado.
    notifyListeners();
  }
}
