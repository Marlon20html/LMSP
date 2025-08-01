import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> services = [
    {'title': 'Dry Cleaning', 'image': 'assets/services/dry.png'},
    {'title': 'Wash-Dry-Fold', 'image': 'assets/services/wash.png'},
    {'title': 'Handwash', 'image': 'assets/services/handwash.png'},
    {'title': 'Shoe Cleaning', 'image': 'assets/services/shoes.png'},
    {'title': 'Press', 'image': 'assets/services/press.png'},
    {'title': 'Corporate Account', 'image': 'assets/services/corporate.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selected Branch", style: TextStyle(fontSize: 16)),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/branch-selector');
              },
              child: Text(
                "CHANGE BRANCH",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications'); // ✅ Works now
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: services.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final service = services[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                service['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.pink),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/schedule',
                                  arguments: {'service': service['title']},
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              service['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/promo.jpg',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 80), // Extra space below promo
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Color(0xFFA1356A),
        onPressed: () {
          Navigator.pushNamed(context, '/chat'); // ✅ Works now
        },
        child: Icon(Icons.chat_bubble_outline, color: Colors.white),
        tooltip: 'Chat Support',
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }
}
