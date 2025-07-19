import 'package:flutter/material.dart';

class AdminFeedbackScreen extends StatefulWidget {
  const AdminFeedbackScreen({super.key});

  @override
  State<AdminFeedbackScreen> createState() => _AdminFeedbackScreenState();
}

class _AdminFeedbackScreenState extends State<AdminFeedbackScreen> {
  final List<Map<String, String>> feedbackList = [
    {
      'user': 'marlon',
      'message': 'Excellent service! Fast and affordable.',
      'date': '2025-07-14'
    },
    {
      'user': 'Chollene',
      'message': 'Pickup was delayed but overall satisfied.',
      'date': '2025-07-13'
    },
    {
      'user': 'Dexter',
      'message': 'Clothes were clean and well folded. Thank you!',
      'date': '2025-07-12'
    },
  ];

  void showMessageDialog(Map<String, String> feedback) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('From: ${feedback['user']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${feedback['date']}'),
            const SizedBox(height: 12),
            Text(feedback['message'] ?? ''),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA1356A),
              foregroundColor: Colors.white,
            ),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Feedback")),
      body: ListView.builder(
        itemCount: feedbackList.length,
        itemBuilder: (context, index) {
          final feedback = feedbackList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.feedback, color: Color(0xFFA1356A)),
              title: Text(feedback['user']!),
              subtitle: Text(
                feedback['message']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.open_in_new, color: Color(0xFFA1356A)),
                onPressed: () => showMessageDialog(feedback),
              ),
            ),
          );
        },
      ),
    );
  }
}
