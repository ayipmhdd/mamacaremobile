// lib/screens/community_screen.dart
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =======================
      // Floating Button (+)
      // =======================
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF3EA5),
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // supaya bisa 3/4 layar
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) => FractionallySizedBox(
              heightFactor: 0.75, // ⬅️ tingginya 3/4 layar
              child: const PostFormPopup(),
            ),
          );
        },
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),

      // =======================
      // Body: List Postingan
      // =======================
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Contoh Posting
          buildPostCard(),
          const SizedBox(height: 16),
          buildPostCard(),
          const SizedBox(height: 16),
          buildPostCard(),
        ],
      ),
    );
  }

  // ========= Card Postingan =========
  Widget buildPostCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header User
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/icons/user.png"),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Siti Fulanah",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  Text("Trimester 2 • 2 jam yang lalu",
                      style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert)
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "Halo Mamas! Aku mau share tips mengatasi morning sickness yang efektif...",
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/pregnant.jpg",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Icon(Icons.favorite_border, size: 18),
              SizedBox(width: 4),
              Text("124", style: TextStyle(fontSize: 12)),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, size: 18),
              SizedBox(width: 4),
              Text("39", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Popup Form 3/4 layar
// ============================================================================
class PostFormPopup extends StatelessWidget {
  const PostFormPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Judul pop-up
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Buat Postingan Baru",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          // Text field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Tulis sesuatu untuk para Mamas...",
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Tombol Post
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3EA5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Posting",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
