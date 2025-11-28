// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mamacaremobile/components/Icon.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 0, 
      color: const Color(0xFFFAFAFA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color(0xFFFF3EA5),
          width: 0.8,
        ),
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 1.15,
                color: Color(0xFFFF3EA5),
              ),
            ),
            Text(
              "Dokter",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xB3FF3EA5),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        subtitle: Row(
          children: const [
            Icon(Icons.star, size: 16, color: Colors.orange),
            SizedBox(width: 4),
            Text(
              "4.9 | 989 Reviews",
              style: TextStyle(color: Color(0xB3777777)),
            ),
          ],
        ),
        trailing: const IconMail(),
      ),
    );
  }
}
