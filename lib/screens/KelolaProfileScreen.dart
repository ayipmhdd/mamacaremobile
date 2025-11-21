// lib/screens/kelola_profil_screen.dart

import 'package:flutter/material.dart';

class KelolaProfilScreen extends StatelessWidget {
  const KelolaProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Kelola Profil"),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // =====================
            // FOTO & NAMA PENGGUNA
            // =====================
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.white,
              child: Column(
                children: [
                  // Foto profil
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: const AssetImage("assets/profile_default.png"),
                  ),
                  const SizedBox(height: 10),

                  // Nama Pengguna
                  const Text(
                    "Mama Ayu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Email
                  const Text(
                    "mamaayu@example.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Tombol ubah foto
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Ubah Foto Profil",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // =====================
            // INFORMASI AKUN
            // =====================
            _buildSectionTitle("Informasi Akun"),

            _buildMenuItem(
              icon: Icons.person,
              title: "Nama Lengkap",
              value: "Mama Ayu",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.email,
              title: "Email",
              value: "mamaayu@example.com",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.phone,
              title: "Nomor Telepon",
              value: "0812-3456-7890",
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // =====================
            // INFORMASI KEHAMILAN
            // =====================
            _buildSectionTitle("Informasi Kehamilan"),

            _buildMenuItem(
              icon: Icons.pregnant_woman,
              title: "Usia Kehamilan",
              value: "24 Minggu",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.event,
              title: "Hari Perkiraan Lahir",
              value: "12 Juli 2025",
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // =====================
            // PENGATURAN
            // =====================
            _buildSectionTitle("Pengaturan"),

            _buildMenuItem(
              icon: Icons.notifications,
              title: "Notifikasi",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.language,
              title: "Bahasa",
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // Logout
            Container(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Keluar Akun",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // =====================
  // WIDGET: Judul Bagian
  // =====================
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  // =====================
  // WIDGET: Menu Item Profil
  // =====================
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? value,
    required VoidCallback onTap,
  }) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.orange[700]),
        title: Text(title),
        subtitle: value != null
            ? Text(
                value,
                style: const TextStyle(color: Colors.grey),
              )
            : null,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
