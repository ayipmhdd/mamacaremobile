// ignore_for_file: file_names
import 'package:flutter/material.dart';

class FaqMamaCareScreen extends StatelessWidget {
  const FaqMamaCareScreen({super.key});

  final List<Map<String, String>> faqList = const [
    {
      "q": "Apa itu aplikasi MamaCare?",
      "a":
          "MamaCare adalah aplikasi pendamping ibu hamil yang menyediakan informasi nutrisi, aktivitas, kalender kehamilan, dan panduan kesehatan."
    },
    {
      "q": "Bagaimana cara mengubah profil saya?",
      "a":
          "Anda dapat mengubah data profil melalui menu 'Kelola Profil' pada halaman Profil."
    },
    {
      "q": "Apakah MamaCare gratis?",
      "a":
          "Ya, seluruh fitur utama MamaCare dapat digunakan secara gratis oleh seluruh pengguna."
    },
    {
      "q": "Bagaimana jika saya menemukan bug atau masalah?",
      "a":
          "Anda dapat menghubungi Helpdesk MamaCare melalui WhatsApp, email, atau telepon pada menu Helpdesk."
    },
    {
      "q": "Apakah data saya aman di MamaCare?",
      "a":
          "MamaCare menggunakan standar keamanan tinggi dan tidak membagikan data pengguna kepada pihak ketiga."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ===================== APPBAR ======================
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "FAQ MamaCare",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),

      // ===================== BODY ======================
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return _faqItem(
            faqList[index]["q"]!,
            faqList[index]["a"]!,
          );
        },
      ),
    );
  }

  // ===================== WIDGET FAQ ITEM ======================
  Widget _faqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

        iconColor: const Color(0xFFFF2F92),
        collapsedIconColor: const Color(0xFFFF2F92),

        title: Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),

        children: [
          Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
