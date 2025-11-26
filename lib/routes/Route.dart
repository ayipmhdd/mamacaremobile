import 'package:flutter/material.dart';
import 'package:mamacaremobile/screens/artikel/ArtikelScreen.dart';
import 'package:mamacaremobile/screens/dokter/DoctorScreen.dart';
import 'package:mamacaremobile/screens/home/HomeScreen.dart';
// import screen lainnya sesuai kebutuhan

class AppRoute {
  static toHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen(username: 'mama',)),
    );
  }

  static toDoctor(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DoctorScreen()),
    );
  }

  static toArticle(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ArticleScreen()),
    );
  }

  // Contoh push replacement
  // static replaceToHome(BuildContext context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (_) => const HomeScreen()),
  //   );
  // }

  // Contoh go back
  static back(BuildContext context) {
    Navigator.pop(context);
  }
}
