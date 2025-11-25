// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/potoprofil.png"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Dr. Siti Fulanah",
              style: TextStyle(
                fontSize: 14, // lebih kecil dari default
                fontWeight: FontWeight.bold,
                height: 1.15,
              ),
            ),
            SizedBox(height: 0), // jarak kecil
            Text(
              "Spesialis Kandungan", // profesinya
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey, // biar beda
              ),
            ),
            SizedBox(height: 5), // jarak kecil
          ],
        ),
        subtitle: Row(
          children: const [
            Icon(Icons.star, size: 16, color: Colors.orange),
            SizedBox(width: 4),
            Text("4.9 | 989 Reviews"),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFFFF72B3),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mail,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
