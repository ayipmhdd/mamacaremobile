// ServiceBox.dart
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
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF3EA5).withOpacity(0.2),
              blurRadius: 4,
            ),
            const BoxShadow(
              color: Colors.white,
            )
          ],
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
