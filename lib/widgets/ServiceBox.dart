// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget { // Nama kelas diubah menjadi ServiceBox
  final String label;

  const ServiceBox({super.key, required this.label}); // Tambahkan super.key

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70, // Lebar kotak ditetapkan
      height: 70, // Tinggi kotak ditetapkan
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Jarak antar kotak
      decoration: BoxDecoration(
        color: Colors.white, // Latar belakang putih
        borderRadius: BorderRadius.circular(12),
        // Menambahkan efek glow/shadow pink
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: const Color(0xFFFF3EA5).withOpacity(0.2), // Warna glow pink (disesuaikan opacity)
            spreadRadius: 0, 
            blurRadius: 10, // Efek glow lebih halus dan terlihat
            offset: Offset.zero, 
          ),
          // Tambahkan shadow putih normal agar kotak terlihat jelas di tengah glow
          const BoxShadow(
            color: Colors.white,
            spreadRadius: 0,
            blurRadius: 0,
          )
        ],
      ),
      child: Center(
        // Placeholder untuk Icon dan Label (jika ada)
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFFFF3EA5), // Warna teks pink
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}