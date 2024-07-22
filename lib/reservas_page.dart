import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reservas_provider.dart';
import 'buttomNavBar.dart';

class ReservasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reservasProvider = Provider.of<ReservasProvider>(context);
    final reservas = reservasProvider.reservas;
    final favoritos = reservasProvider.favoritos;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Reservas',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            reservas.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Nenhuma reserva',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reservas.length,
                    itemBuilder: (context, index) {
                      final book = reservas[index];
                      return Card(
                        color: Colors.grey[850],
                        margin: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Image.asset(book.imagePath,
                              height: 50, width: 50, fit: BoxFit.cover),
                          title: Text(book.title,
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(book.author,
                              style: TextStyle(color: Colors.grey)),
                          trailing: ElevatedButton(
                            onPressed: () {
                              reservasProvider.removerReserva(book);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Devolver'),
                          ),
                        ),
                      );
                    },
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Favoritos',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            favoritos.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Nenhum favorito',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: favoritos.length,
                    itemBuilder: (context, index) {
                      final book = favoritos[index];
                      return Card(
                        color: Colors.grey[850],
                        margin: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Image.asset(book.imagePath,
                              height: 50, width: 50, fit: BoxFit.cover),
                          title: Text(book.title,
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(book.author,
                              style: TextStyle(color: Colors.grey)),
                          trailing: ElevatedButton(
                            onPressed: () {
                              reservasProvider.removerFavorito(book);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Remover'),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
