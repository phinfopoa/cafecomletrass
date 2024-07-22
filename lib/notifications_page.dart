import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reservas_provider.dart';
import 'buttomNavBar.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReservasProvider>(context, listen: false)
          .markNotificationsAsRead();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<ReservasProvider>(context).notifications;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:
            const Text('Notificações', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: notifications.isEmpty
          ? Center(
              child: Text('Nenhuma notificação',
                  style: TextStyle(color: Colors.white)),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[850],
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(notifications[index],
                        style: TextStyle(color: Colors.white)),
                    leading: Icon(Icons.notifications, color: Colors.white),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
