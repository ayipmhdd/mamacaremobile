// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  int _dotCount = 1;
  late Timer _timer;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    // Controller animasi untuk logo muter
    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(); // muter terus

    // Timer animasi titik
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount % 3) + 1; // 1 -> 2 -> 3 -> balik ke 1
      });
    });

    // Simulasi loading selesai
    Future.delayed(const Duration(seconds: 4), () {
      _timer.cancel();
      _rotationController.stop();
      if (!mounted) return; // <- tambahkan ini
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo muter
            RotationTransition(
              turns: _rotationController,
              child: Image.asset(
                "assets/logo.png",
                width: 80,
              ),
            ),
            const SizedBox(height: 20),

            // Teks + animasi titik
            Text(
              "Memuat${"." * _dotCount}",
              style: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF3EA5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
