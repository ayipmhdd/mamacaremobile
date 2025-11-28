// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mamacaremobile/screens/profile/HelpdeskScreen.dart';
import 'package:mamacaremobile/screens/profile/UserGuideScreen.dart';
import 'package:mamacaremobile/screens/profile/KataSandiScreen.dart';
import 'package:mamacaremobile/screens/profile/KelolaAkunScreen.dart';
import 'package:mamacaremobile/screens/profile/FaqMamaCareScreen.dart';
import 'package:mamacaremobile/screens/profile/KelolaProfileScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ===================== APPBAR ======================
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD5E5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.arrow_back, color: Color(0xFFFF2F92)),
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          "Profil",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD5E5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.logout, color: Color(0xFFFF2F92)),
            ),
            onPressed: () {}, // Aksi tombol logout
          )
        ],
      ),

      // ===================== BODY ======================
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // FOTO PROFIL
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/images/user.jpg"),
            ),

            const SizedBox(height: 12),

            // NAMA & EMAIL
            const Text(
              "Fulanah",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "siti.fulanah@gmail.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            // CARD MENU
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6F1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  _menuItem(
                    icon: Icons.person,
                    title: "Kelola Profil",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const KelolaProfilScreen()),
                      );
                    },
                  ),
                  _menuItem(
                    icon: Icons.lock,
                    title: "Kata Sandi",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const KataSandiScreen()),
                      );
                    },
                  ),
                  _menuItem(
                    icon: Icons.group,
                    title: "Kelola Akun",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const KelolaAkunScreen()),
                      );
                    },
                  ),
                  _menuItem(
                    icon: Icons.menu_book,
                    title: "User Guide",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const UserGuideScreen()),
                      );
                    },
                  ),
                  _menuItem(
                    icon: Icons.chat_bubble_outline,
                    title: "Helpdesk",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HelpdeskScreen()),
                      );
                    },
                  ),
                  _menuItem(
                    icon: Icons.help_outline,
                    title: "Pertanyaan Seputar MamaCare",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FaqMamaCareScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ===================== WIDGET MENU ITEM ======================
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFFFF2F92),
              size: 22,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
