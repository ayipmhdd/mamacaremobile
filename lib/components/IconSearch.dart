import 'package:flutter/material.dart';
// import 'package:mamacaremobile/screens/home/SearchScreen.dart';

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
