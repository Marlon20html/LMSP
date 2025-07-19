import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, String>> mockNotifications = const [
    {
      'title': 'Order Ready for Pickup',
      'subtitle': 'Your laundry is ready for pickup at Bolbok branch.',
      'time': '10 mins ago',
    },
    {
      'title': 'Promo Alert!',
      'subtitle': 'Get 10% off on Wash-Dry-Fold until July 25!',
      'time': '1 hour ago',
    },
    {
      'title': 'Order Confirmed',
      'subtitle': 'Your order #12345 has been confirmed.',
      'time': 'Yesterday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: mockNotifications.length,
        itemBuilder: (context, index) {
          final notif = mockNotifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Color(0xFFA1356A)),
              title: Text(notif['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(notif['subtitle']!),
              trailing: Text(
                notif['time']!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
