// lib/screens/user_guide_screen.dart
import 'package:flutter/material.dart';

class UserGuideScreen extends StatelessWidget {
  const UserGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Guide"),
      ),
      body: const Center(
        child: Text("Panduan Penggunaan MamaCare"),
      ),
    );
  }
}
