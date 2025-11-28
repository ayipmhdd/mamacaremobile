// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Artikel
        

        // Kartu Artikel
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFF3EA5), // background pink
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar artikel
              Padding(
                padding: const EdgeInsets.all(10), // margin-top 5
                child: Align(
                  alignment: Alignment.center, // rata tengah horizontal
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/mamacareartikel.png",
                      height: 200,
                      width: 315,
                      fit: BoxFit.cover, // biar gambar tetap proporsional
                    ),
                  ),
                ),
              ),

              // Isi artikel
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 23.0,
                  right: 16.0,
                  left: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Judul artikel
                    const Text(
                      "Alasan Ngidam Saat Hamil dan Tips Menghadapinya",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Penulis + tanggal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Avatar penulis
                            const CircleAvatar(
                              radius: 14,
                              backgroundImage:
                                  AssetImage("assets/potoprofil.png"), // ganti foto profil
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Fulanah, S.Tr.Keb",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "10 Sept, 2025",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
