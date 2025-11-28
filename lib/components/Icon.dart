// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mamacaremobile/screens/home/NotifikasiScreen.dart';
// import 'package:mamacaremobile/screens/home/SearchScreen.dart';

/// ICON MAIL
class IconMail extends StatelessWidget {
  const IconMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFFF3EA5),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.mail,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}

/// ICON NOTIFIKASI
class IconNotifikasi extends StatelessWidget {
  const IconNotifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotificationScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.notifications_none,
          size: 24,
          color: Color(0xFFFF3EA5),
        ),
      ),
    );
  }
}

/// ICON SEARCH
class IconSearch extends StatelessWidget {
  const IconSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30), // efek ripple
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => const SearchScreen()),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(6), // ruang icon
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.search,
          size: 24,
          color: Color(0xFFFF3EA5), // warna pink seperti notifikasi
        ),
      ),
    );
  }
}