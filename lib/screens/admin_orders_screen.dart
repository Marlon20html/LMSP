import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  List<Map<String, String>> orders = [
    {
      'id': '001',
      'status': 'Picked Up',
      'date': 'July 10, 2025 - 10:30 AM',
      'service': 'Wash-Dry-Fold',
      'branch': 'Libjo',
      'delivery': 'July 11, 2025 - 5:00 PM'
    },
    {
      'id': '002',
      'status': 'Washing',
      'date': 'July 11, 2025 - 8:00 AM',
      'service': 'Shoe Cleaning',
      'branch': 'Banaba East',
      'delivery': 'July 12, 2025 - 4:00 PM'
    },
  ];

  void editOrder(int index) async {
    final updated = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        TextEditingController statusCtrl =
            TextEditingController(text: orders[index]['status']);

        return AlertDialog(
          title: const Text("Edit Order", style: TextStyle(color: Color(0xFFA1356A))),
          content: TextField(
            controller: statusCtrl,
            decoration: const InputDecoration(labelText: 'Status'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA1356A)),
              onPressed: () {
                Navigator.pop(context, {
                  'status': statusCtrl.text,
                });
              },
              child: const Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );

    if (updated != null) {
      setState(() {
        orders[index]['status'] = updated['status']!;
      });
    }
  }

  void printReceipt(String orderId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("🧾 Receipt printed for Order #$orderId")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Orders")),
      body: ListView.separated(
        itemCount: orders.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFFF8BBD0),
              child: Text(order['id']!),
            ),
            title: Text("Order #${order['id']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("📅 ${order['date']}"),
                Text("🧺 ${order['service']}"),
                Text("📍 ${order['branch']}"),
                Text("🚚 ETA: ${order['delivery']}"),
                Text("🗂️ Status: ${order['status']}"),
              ],
            ),
            isThreeLine: true,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFFA1356A)),
                  onPressed: () => editOrder(index),
                ),
                IconButton(
                  icon: const Icon(Icons.print, color: Color(0xFFA1356A)),
                  onPressed: () => printReceipt(order['id']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
