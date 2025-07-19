import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class OrdersScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'id': '001',
      'status': 'Picked Up',
      'date': '2025-07-15 10:00 AM',
      'service': 'Wash-Dry-Fold',
      'branch': 'Libjo',
      'eta': '2:00 PM'
    },
    {
      'id': '002',
      'status': 'Washing',
      'date': '2025-07-14 4:30 PM',
      'service': 'Handwash',
      'branch': 'Banaba East',
      'eta': 'Today 6:00 PM'
    },
    {
      'id': '003',
      'status': 'Ready for Delivery',
      'date': '2025-07-13 9:15 AM',
      'service': 'Dry Cleaning',
      'branch': 'Bolbok',
      'eta': 'Tomorrow 9:00 AM'
    },
    {
      'id': '004',
      'status': 'Delivered',
      'date': '2025-07-12 1:45 PM',
      'service': 'Shoe Cleaning',
      'branch': 'Cuta Dagatan',
      'eta': 'Delivered'
    },
  ];

  void _showRatingDialog(BuildContext context, String orderId) {
    showDialog(
      context: context,
      builder: (context) {
        double rating = 0;
        return AlertDialog(
          title: Text("Rate Order #$orderId"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("How was the service?"),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      rating = index + 1.0;
                      (context as Element).markNeedsBuild(); // refresh the dialog
                    },
                  );
                }),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA1356A)),
              child: Text("Submit", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Thanks for rating Order #$orderId!")),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final order = orders[index];
          final status = order['status'] ?? '';
          final isCompleted = status == 'Delivered' || status == 'Picked Up';

          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Order #${order['id']}", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("📅 Date/Time: ${order['date']}"),
                Text("🧺 Service: ${order['service']}"),
                Text("📍 Location: ${order['branch']}"),
                Text("🚚 ETA: ${order['eta']}"),
                Text("🗒 Status: ${order['status']}"),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Contacting support for Order #${order['id']}")),
                        );
                      },
                      icon: Icon(Icons.support_agent, color: Color(0xFFA1356A)),
                      label: Text("Contact Support"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFFA1356A),
                        side: BorderSide(color: Color(0xFFA1356A)),
                      ),
                    ),
                    if (isCompleted) SizedBox(width: 8),
                    if (isCompleted)
                      ElevatedButton.icon(
                        icon: Icon(Icons.star, color: Colors.white),
                        label: Text("Rate", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFA1356A)),
                        onPressed: () {
                          _showRatingDialog(context, order['id'] ?? '');
                        },
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNav(currentIndex: 3),
    );
  }
}
