import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reservas_provider.dart';
import 'buttomNavBar.dart'; // Importe o BottomNavBar

class ReservasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservasProvider = Provider.of<ReservasProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Reservas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: reservasProvider.reservas.isEmpty
            ? Center(
                child: Text(
                  'Nenhum livro reservado.',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : ListView.builder(
                itemCount: reservasProvider.reservas.length,
                itemBuilder: (context, index) {
                  final book = reservasProvider.reservas[index];
                  return Card(
                    color: Colors.grey[850],
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: Image.asset(
                        book.imagePath,
                        width: 60,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        book.title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        book.author,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          reservasProvider.removerReserva(book);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomNavBar(), // Adiciona o BottomNavBar
    );
  }
}
