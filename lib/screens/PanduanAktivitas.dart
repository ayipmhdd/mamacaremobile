import 'package:flutter/material.dart';

class PanduanAktivitas extends StatelessWidget {
  const PanduanAktivitas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Panduan Aktivitas",
          style: TextStyle(
            color: Color(0xFFFF3EA5),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFF3EA5)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // INTRO
            const Text(
              "Aktivitas untuk Ibu Hamil",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Berikut adalah aktivitas yang aman dan direkomendasikan untuk kesehatan ibu dan perkembangan janin.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // KATEGORI AKTIVITAS
            const Text(
              "Jenis Aktivitas Aman",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 12),

            _activityCard(
              icon: Icons.directions_walk_rounded,
              title: "Jalan Santai",
              description:
                  "Aktivitas ringan yang membantu melancarkan peredaran darah dan menjaga kebugaran tubuh.",
            ),
            _activityCard(
              icon: Icons.pool_rounded,
              title: "Renang",
              description:
                  "Olahraga yang aman karena menahan beban tubuh dan mengurangi nyeri punggung.",
            ),
            _activityCard(
              icon: Icons.self_improvement_rounded,
              title: "Yoga Kehamilan",
              description:
                  "Membantu relaksasi, pernapasan, dan fleksibilitas tubuh selama masa kehamilan.",
            ),
            _activityCard(
              icon: Icons.pregnant_woman_rounded,
              title: "Senam Hamil",
              description:
                  "Dipandu untuk menjaga kelancaran persalinan dan memperkuat otot panggul.",
            ),
            const SizedBox(height: 20),

            // REKOMENDASI PER TRIMESTER
            const Text(
              "Rekomendasi Aktivitas per Trimester",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 12),

            _trimesterCard(
              trimester: "Trimester 1",
              tips: [
                "Fokus pada aktivitas ringan.",
                "Hindari olahraga berat & melompat.",
                "Lakukan peregangan rutin."
              ],
            ),
            _trimesterCard(
              trimester: "Trimester 2",
              tips: [
                "Mulai lakukan yoga & renang.",
                "Jalan 20–30 menit sehari.",
                "Latihan pernapasan."
              ],
            ),
            _trimesterCard(
              trimester: "Trimester 3",
              tips: [
                "Fokus pada senam hamil.",
                "Hindari posisi tidur telentang saat olahraga.",
                "Lakukan latihan pinggul."
              ],
            ),
            const SizedBox(height: 20),

            // PANDUAN KEAMANAN
            const Text(
              "Panduan Keamanan Aktivitas",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF191F24),
              ),
            ),
            const SizedBox(height: 12),

            _safetyTip("Stop aktivitas jika muncul pusing, mual, atau sesak."),
            _safetyTip("Hindari angkat beban terlalu berat."),
            _safetyTip("Minum air putih sebelum, saat, dan setelah beraktivitas."),
            _safetyTip("Gunakan pakaian longgar dan nyaman."),
            _safetyTip("Hindari olahraga kontak fisik atau berisiko jatuh."),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // COMPONENT: ACTIVITIES CARD
  Widget _activityCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF3EA5).withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 36, color: const Color(0xFFFF3EA5)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191F24),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // COMPONENT: TRIMESTER CARD
  Widget _trimesterCard({
    required String trimester,
    required List<String> tips,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE8F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trimester,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF3EA5),
            ),
          ),
          const SizedBox(height: 8),
          ...tips.map(
            (tip) => Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFFFF3EA5), size: 18),
                const SizedBox(width: 8),
                Expanded(child: Text(tip)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // COMPONENT: SAFETY TIP
  Widget _safetyTip(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded,
              color: Color(0xFFFF3EA5), size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
