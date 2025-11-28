// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ServiceBox({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFFF3EA5), // border warna pink
            width: 0.8,
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFF3EA5),
              fontSize: 8,
            ),
          ),
        ),
      ),
    );
  }
}