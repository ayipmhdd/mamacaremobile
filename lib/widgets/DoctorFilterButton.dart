// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DoctorFilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onPressed; 

  const DoctorFilterButton({
    super.key,
    required this.label, 
    this.isSelected = false, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF3EA5) : const Color.fromARGB(255, 238, 238, 238),
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: const Color(0xFFDCDCDC)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF787A7E),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}