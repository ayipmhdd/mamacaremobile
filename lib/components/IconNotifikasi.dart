import 'package:flutter/material.dart';
import 'package:mamacaremobile/screens/home/NotifikasiScreen.dart';

class IconNotifikasi extends StatelessWidget {
  const IconNotifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30), // efek ripple bulat
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotificationScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6), // ruang dalam biar bulat rapi
        decoration: const BoxDecoration(
          color: Colors.white,           // background putih
          shape: BoxShape.circle,        // bentuk bulat
        ),
        child: const Icon(
          Icons.notifications_none,
          size: 24,
          color: Color(0xFFFF3EA5),           // warna icon
        ),
      ),
    );
  }
}