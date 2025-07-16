import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          // Bottom bar background with side items
          Positioned.fill(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildItem(context, Icons.home, "Home", 0, '/home'),
                  _buildItem(context, Icons.local_offer, "Price", 1, '/price'),
                  const SizedBox(width: 72), // Space for FAB
                  _buildItem(context, Icons.receipt_long, "Orders", 3, '/orders'),
                  _buildItem(context, Icons.person, "Profile", 4, '/profile'),
                ],
              ),
            ),
          ),

          // Center FAB + label
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/schedule');
                  },
                  backgroundColor: const Color(0xFFFF9AC2),
                  child: const Icon(Icons.calendar_month, color: Colors.white),
                  elevation: 4,
                ),
                const SizedBox(height: 4),
                Text(
                  "Schedule Now",
                  style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == 2 ? Color(0xFFC74385) : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    IconData icon,
    String label,
    int index,
    String route,
  ) {
    final bool isSelected = currentIndex == index;
    final Color iconColor = isSelected ? const Color(0xFFC74385) : Colors.grey;

    return GestureDetector(
      onTap: () {
        if (!isSelected) Navigator.pushReplacementNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: iconColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
