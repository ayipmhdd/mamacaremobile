// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Cari dokter, saran nutrisi, dll",
          hintStyle: TextStyle(
            color: Color(0xFFB6B6B6),
            fontSize: 14,
          ),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Color(0xFF787A7E)),
        ),
      ),
    );
  }
}