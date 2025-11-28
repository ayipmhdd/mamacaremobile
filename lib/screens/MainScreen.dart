// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mamacaremobile/screens/home/HomeScreen.dart';
import 'package:mamacaremobile/screens/artikel/ArtikelScreen.dart';
import 'package:mamacaremobile/screens/profile/ProfileScreen.dart';
import 'package:mamacaremobile/screens/komunitas/ComunityScreen.dart';

import 'package:mamacaremobile/layouts/CustomBottomNavBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  // daftar halaman yang sesuai urutan bottom nav
  final List<Widget> _pages = [
    HomeScreen(username: "Mama",),
    ArticleScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // update index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex], // tampilkan halaman sesuai index
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
