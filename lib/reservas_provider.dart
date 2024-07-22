import 'package:flutter/material.dart';
import 'package:proj_curso/bookData.dart';

class ReservasProvider with ChangeNotifier {
  final List<Book> _reservas = [];
  final List<String> _notifications = [];
  bool _hasUnreadNotifications = false;
  static const int maxReservas = 2;

  List<Book> get reservas => _reservas;
  List<String> get notifications => _notifications;
  bool get hasUnreadNotifications => _hasUnreadNotifications;

  String adicionarReserva(Book book) {
    // Verifica se o livro já está reservado
    if (_reservas
        .any((b) => b.title == book.title && b.author == book.author)) {
      return "Este livro já está reservado.";
    }

    // Verifica o limite de reservas
    if (_reservas.length >= maxReservas) {
      return "Você só pode reservar até $maxReservas livros.";
    }

    _reservas.add(book);
    _addNotification("Livro reservado: ${book.title}, ${book.author}");
    notifyListeners();
    return "Livro reservado com sucesso.";
  }

  void removerReserva(Book book) {
    _reservas.remove(book);
    _addNotification("Livro devolvido: ${book.title}, ${book.author}");
    notifyListeners();
  }

  void _addNotification(String message) {
    final now = DateTime.now();
    final formattedDate =
        "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
    _notifications.add("[$formattedDate] $message");
    _hasUnreadNotifications = true;
  }

  void markNotificationsAsRead() {
    _hasUnreadNotifications = false;
    notifyListeners();
  }
}
