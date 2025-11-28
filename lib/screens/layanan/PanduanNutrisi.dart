// ignore_for_file: file_names
import 'package:flutter/material.dart';

class PanduanNutrisi extends StatelessWidget {
  const PanduanNutrisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFF3EA5)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Panduan Nutrisi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF191F24),
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =============================
            // PENDAHULUAN
            // =============================
            const Text(
              "Nutrisi yang baik sangat penting untuk mendukung kesehatan ibu hamil dan perkembangan janin. Berikut panduan lengkap nutrisi MamaCare.",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // =============================
            // KATEGORI NUTRISI
            // =============================
            const Text(
              "Nutrisi Penting",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _categoryBox("Asam Folat", "Mencegah cacat tabung saraf janin"),
                _categoryBox("Zat Besi", "Mencegah anemia & lemas"),
                _categoryBox("Kalsium", "Pembentukan tulang bayi"),
                _categoryBox("Omega-3", "Perkembangan otak janin"),
                _categoryBox("Protein", "Pertumbuhan jaringan tubuh"),
                _categoryBox("Vitamin D", "Penyerapan kalsium"),
              ],
            ),

            const SizedBox(height: 25),

            // =============================
            // KEBUTUHAN TRIMESTER
            // =============================
            const Text(
              "Kebutuhan Nutrisi per Trimester",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 20),

            _trimesterProgress(
              "Trimester 1",
              "Fokus utama: Asam folat dan vitamin B6",
              0.4,
            ),
            const SizedBox(height: 15),

            _trimesterProgress(
              "Trimester 2",
              "Fokus utama: Kalsium, zat besi, dan protein",
              0.7,
            ),
            const SizedBox(height: 15),

            _trimesterProgress(
              "Trimester 3",
              "Fokus utama: Omega-3 & energi tambahan",
              0.9,
            ),

            const SizedBox(height: 25),

            // =============================
            // REKOMENDASI MAKANAN
            // =============================
            const Text(
              "Rekomendasi Makanan Baik",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 15),

            _foodItem("Sayuran hijau", "Kaya folat & zat besi", "assets/food/sayur.png"),
            _foodItem("Ikan salmon", "Kaya omega-3 & protein", "assets/food/salmon.png"),
            _foodItem("Telur", "Sumber protein lengkap", "assets/food/telur.png"),
            _foodItem("Buah-buahan", "Vitamin & antioksidan", "assets/food/buah.png"),

            const SizedBox(height: 25),

            const Text(
              "Makanan yang Perlu Dihindari",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE53935),
              ),
            ),
            const SizedBox(height: 15),

            _warningFood("Daging mentah atau setengah matang"),
            _warningFood("Ikan tinggi merkuri"),
            _warningFood("Kafein berlebihan"),
            _warningFood("Keju tidak dipasteurisasi"),

            const SizedBox(height: 25),

            // =============================
            // MENU HARIAN
            // =============================
            const Text(
              "Contoh Menu Harian",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 15),

            _menuBox(
              "Sarapan",
              "Oatmeal + buah + telur rebus",
              "assets/food/oatmeal.png",
            ),
            const SizedBox(height: 12),
            _menuBox(
              "Makan Siang",
              "Nasi merah + ayam panggang + sayur",
              "assets/food/ayam.png",
            ),
            const SizedBox(height: 12),
            _menuBox(
              "Makan Malam",
              "Ikan salmon + brokoli kukus",
              "assets/food/salmon2.png",
            ),
            const SizedBox(height: 12),
            _menuBox(
              "Snack",
              "Yogurt + buah potong",
              "assets/food/yogurt.png",
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================
  //  WIDGET: KATEGORI NUTRISI
  // ===========================================================
  Widget _categoryBox(String title, String desc) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE7F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF3EA5),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          )
        ],
      ),
    );
  }

  // ===========================================================
  //  WIDGET: TRIMESTER PROGRESS
  // ===========================================================
  Widget _trimesterProgress(String title, String desc, double progress) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE7F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF191F24))),
          const SizedBox(height: 5),
          Text(desc, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.white,
              valueColor:
                  const AlwaysStoppedAnimation(Color(0xFFFF3EA5)),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  //  WIDGET: FOOD ITEM
  // ===========================================================
  Widget _foodItem(String title, String desc, String imgPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imgPath, width: 50, height: 50, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191F24))),
              Text(desc,
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          )
        ],
      ),
    );
  }

  // ===========================================================
  //  WIDGET: WARNING FOOD
  // ===========================================================
  Widget _warningFood(String text) {
    return Row(
      children: [
        const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black87),
          ),
        )
      ],
    );
  }

  // ===========================================================
  //  WIDGET: MENU HARIAN
  // ===========================================================
  Widget _menuBox(String title, String desc, String imgPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imgPath, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF191F24))),
              Text(desc,
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          )
        ],
      ),
    );
  }
}
