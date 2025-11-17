// lib/screens/article_detail_screen.dart
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Artikel",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.pink),
            onPressed: () {},
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // === Artikel utama ===
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFF3EA5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("assets/images/mama_eating.jpg"),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Alasan Ngidam Saat Hamil dan Tips Menghadapinya",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage("assets/images/author.png"),
                      ),
                      SizedBox(width: 8),
                      Text("Fulanah, S.Tr.Keb",
                          style: TextStyle(color: Colors.white)),
                      Spacer(),
                      Text("10 Sept 2025",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // === Isi Artikel ===
            const Text(
              "Ngidam merupakan hal yang umum dialami oleh setiap wanita di awal masa kehamilan..."
              "\n\nSetiap ibu hamil memiliki pengalaman yang berbeda saat ngidam..."
              "\n\n1. Perubahan hormon ..."
              "\n\n2. Kekurangan nutrisi ..."
              "\n\n3. Pengalihan ...",
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 20),

            // === Komentar ===
            const Text(
              "Komentar (1249)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            Column(
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("assets/images/author.png"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Fulanah binti Fulan",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Wah artikelnya sangat berguna sekali, membuat saya jadi makin tahu...",
                              style: TextStyle(fontSize: 13, height: 1.4),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: const [
                                Icon(Icons.thumb_up_alt_outlined,
                                    size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text("789 Suka",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                SizedBox(width: 16),
                                Icon(Icons.comment_outlined,
                                    size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text("163 Balasan",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),

      // === Bottom field komentar ===
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tulis sebuah komentar...",
                    filled: true,
                    fillColor: const Color(0xFFFDE5F1),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF3EA5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}