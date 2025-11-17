// lib/screens/main_screen.dart
import 'package:flutter/material.dart';
import '../widgets/CustomBottomNavBar.dart';
import 'HomeScreen.dart';
import 'ArtikelScreen.dart';
import 'ComunityScreen.dart';
import 'ProfileScreen.dart';

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
