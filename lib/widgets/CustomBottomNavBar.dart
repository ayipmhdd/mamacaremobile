// lib/widgets/custom_bottom_nav_bar.dart

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFFF3EA5);

    // List asset icon sesuai index
    final List<Map<String, String>> icons = [
      {
        "active": "assets/icons/home-active.png",
        "inactive": "assets/icons/home-inactive.png"
      },
      {
        "active": "assets/icons/article-active.png",
        "inactive": "assets/icons/article-inactive.png"
      },
      {
        "active": "assets/icons/community-active.png",
        "inactive": "assets/icons/community-inactive.png"
      },
      {
        "active": "assets/icons/profile-active.png",
        "inactive": "assets/icons/profile-inactive.png"
      },
    ];

    final List<String> labels = ["Home", "Artikel", "Komunitas", "Profil"];

    return BottomAppBar(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            bool isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isSelected
                        ? icons[index]["active"]!
                        : icons[index]["inactive"]!,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? primaryPink : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
