import 'package:flutter/material.dart';

class AdminPricesScreen extends StatefulWidget {
  const AdminPricesScreen({super.key});

  @override
  State<AdminPricesScreen> createState() => _AdminPricesScreenState();
}

class _AdminPricesScreenState extends State<AdminPricesScreen> {
  List<Map<String, dynamic>> services = [
    {'name': 'Dry Cleaning', 'price': 100},
    {'name': 'Wash-Dry-Fold', 'price': 80},
    {'name': 'Handwash', 'price': 60},
    {'name': 'Shoe Cleaning', 'price': 120},
    {'name': 'Press', 'price': 70},
    {'name': 'Corporate Account', 'price': 150},
  ];

  void editPrice(int index) async {
    TextEditingController priceController = TextEditingController(
      text: services[index]['price'].toString(),
    );

    final updated = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Price - ${services[index]['name']}", style: const TextStyle(color: Color(0xFFA1356A))),
        content: TextField(
          controller: priceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'New Price (₱)'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final newPrice = int.tryParse(priceController.text);
              if (newPrice != null) {
                Navigator.pop(context, newPrice);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA1356A)),
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (updated != null) {
      setState(() {
        services[index]['price'] = updated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Prices")),
      body: ListView.separated(
        itemCount: services.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = services[index];
          return ListTile(
            leading: const Icon(Icons.local_offer, color: Color(0xFFA1356A)),
            title: Text(item['name']),
            subtitle: Text("Current Price: ₱${item['price']}"),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Color(0xFFA1356A)),
              onPressed: () => editPrice(index),
            ),
          );
        },
      ),
    );
  }
}
