import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  final double textSize;

  const Logo({
    super.key,
    this.size = 40,
    this.textSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/logo.png", width: size),
        const SizedBox(width: 8),
        Text(
          "MamaCare",
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.w900,
            color: const Color(0xFFFF3EA5),
          ),
        ),
      ],
    );
  }
}
