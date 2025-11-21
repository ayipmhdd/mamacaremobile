// lib/screens/helpdesk_screen.dart
import 'package:flutter/material.dart';

class HelpdeskScreen extends StatelessWidget {
  const HelpdeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Helpdesk MamaCare",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Butuh bantuan?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),

            const Text(
              "Tim MamaCare siap membantu kapan saja.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            // ===================== KONTAK CARD ======================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Kontak Helpdesk",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "📞 Telepon : +62 812-3456-7890",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 6),

                  Text(
                    "📧 Email : helpdesk@mamacare.id",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 6),

                  Text(
                    "💬 WhatsApp : +62 812-3456-7890",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===================== FAQ ======================
            const Text(
              "Pertanyaan Umum",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),

            _faqItem(
              "Bagaimana cara menggunakan MamaCare?",
              "Anda dapat melihat panduan lengkap di bagian User Guide.",
            ),
            _faqItem(
              "Apakah MamaCare gratis?",
              "Ya, semua fitur utama gratis digunakan.",
            ),
            _faqItem(
              "Bagaimana cara mengubah profil?",
              "Anda dapat mengelolanya di menu Kelola Profil.",
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  // ===================== FAQ ITEM ======================
  Widget _faqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            answer,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
