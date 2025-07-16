import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class OrdersScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {'id': '001', 'status': 'Picked Up'},
    {'id': '002', 'status': 'Washing'},
    {'id': '003', 'status': 'Ready for Delivery'},
    {'id': '004', 'status': 'Delivered'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: ListView.separated(
        itemCount: orders.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFF8BBD0),
              child: Text(order['id']!),
            ),
            title: Text("Order #${order['id']}"),
            subtitle: Text("Status: ${order['status']}"),
          );
        },
      ),
      bottomNavigationBar: BottomNav(currentIndex: 3),
    );
  }
}
