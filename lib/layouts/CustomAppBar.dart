import 'package:flutter/material.dart';
import 'package:mamacaremobile/components/IconNotifikasi.dart';
import 'package:mamacaremobile/components/IconSearch.dart';

class CustomAppBar {
  // === STYLE 1: APPBAR UNTUK HOMESCREEN ===
  static PreferredSizeWidget home({
    required String username,
    required String? photoUrl,
    required String greeting,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFFF3EA5),
      elevation: 0,
      toolbarHeight: 70,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFFAFAFA),
            backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
            child: photoUrl == null
                ? Text(
                    _getInitials(username),
                    style: const TextStyle(
                        color: Color(0xFFFF3EA5), fontWeight: FontWeight.bold),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$greeting!\n",
                  style: const TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: username,
                  style: const TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: IconSearch(),
        ),
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: IconNotifikasi(),
        ),
      ]
    );
  }

  // === STYLE 2: APPBAR UNTUK HALAMAN LAIN ===
  static PreferredSizeWidget normal({
    required BuildContext context,
    required String title,
    bool centerTitle = true,
    VoidCallback? onShare,
  }) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: centerTitle,
      actions: [
        IconButton(
          icon: const Icon(Icons.share, color: Colors.pink),
          onPressed: onShare ?? () {},
        )
      ],
    );
  }

  // Fungsi ambil inisial nama
  static String _getInitials(String name) {
    List<String> parts = name.trim().split(" ");
    if (parts.length > 1) {
      return parts[0][0].toUpperCase() + parts[1][0].toUpperCase();
    } else {
      return parts[0][0].toUpperCase();
    }
  }
}
