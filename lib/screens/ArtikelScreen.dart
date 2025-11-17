// lib/screens/article_screen.dart
import 'package:flutter/material.dart';
import '../widgets/ArticleSection.dart';
import 'ArtikelDetailScreen.dart'; // import halaman detail

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Artikel Terbaru",
          style: TextStyle(
            color: Color(0xFF191F24),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0, right: 16, left: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // === Bagian atas dari widget lain ===
            const ArticleSection(),
            const SizedBox(height: 20),

            // === Chips kategori ===
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChip("Semua", true),
                  _buildChip("Trimester", false),
                  _buildChip("Olahraga", false),
                  _buildChip("Persalinan", false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // === List artikel kecil ===
            Column(
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    // ketika diklik, pindah ke halaman detail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ArticleDetailScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/potoprofil.png",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Alasan Ngidam Saat Hamil dan Tips Menghadapinya",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF191F24),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundImage: AssetImage("assets/images/author.png"),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Fulanah, S.Tr.Keb",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787A7E),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "31 Agt 2025",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF787A7E),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF3EA5) : const Color(0xFFFDE5F1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFFFF3EA5),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
