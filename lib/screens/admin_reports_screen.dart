import 'package:flutter/material.dart';

class AdminReportsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reports = [
    {'branch': 'Libjo', 'income': 12000},
    {'branch': 'Banaba East', 'income': 9500},
    {'branch': 'Bolbok', 'income': 15200},
    {'branch': 'Cuta Dagatan', 'income': 11800},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Branch Reports")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final report = reports[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFA1356A), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report['branch'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA1356A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Income: ₱${report['income']}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
