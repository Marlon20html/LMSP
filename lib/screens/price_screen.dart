import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class PriceScreen extends StatelessWidget {
  final List<Map<String, String>> priceItems = [
    {'service': 'Dry Cleaning', 'price': '₱100'},
    {'service': 'Wash-Dry-Fold', 'price': '₱70'},
    {'service': 'Handwash', 'price': '₱80'},
    {'service': 'Shoe Cleaning', 'price': '₱120'},
    {'service': 'Press', 'price': '₱50'},
    {'service': 'Corporate Account', 'price': 'Custom Pricing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Price List")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: ListView.separated(
          itemCount: priceItems.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (context, index) {
            final item = priceItems[index];
            return ListTile(
              title: Text(
                item['service']!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                item['price']!,
                style: TextStyle(color: Color(0xFFA1356A), fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1),
    );
  }
}
