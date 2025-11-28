// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mamacaremobile/screens/home/HomeScreen.dart';
import 'package:mamacaremobile/screens/dokter/DoctorScreen.dart';
import 'package:mamacaremobile/screens/artikel/ArtikelScreen.dart';

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
