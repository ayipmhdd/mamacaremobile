// ignore_for_file: file_names
import 'package:flutter/material.dart';

class KelolaAkunScreen extends StatelessWidget {
  const KelolaAkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh list akun (nanti bisa diganti dari backend)
    final List<Map<String, dynamic>> akunList = [
      {
        "name": "Fulanah",
        "email": "siti.fulanah@gmail.com",
        "image": "assets/images/user.jpg",
        "active": true,
      },
      {
        "name": "Aisyah",
        "email": "aisyah.mama@example.com",
        "image": "assets/images/user2.jpg",
        "active": false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Kelola Akun",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),

      // ===================== BODY ======================
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              "Akun yang tersimpan di perangkat ini",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 15),

            // ===================== LIST AKUN ======================
            Expanded(
              child: ListView.builder(
                itemCount: akunList.length,
                itemBuilder: (context, index) {
                  final akun = akunList[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // FOTO PROFIL
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(akun["image"]),
                        ),

                        const SizedBox(width: 15),

                        // NAMA & EMAIL
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                akun["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                akun["email"],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),

                              if (akun["active"]) ...[
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    "Sedang aktif",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),

                        // TOMBOL AKSI
                        if (!akun["active"])
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[700],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                // TODO: logika pindah akun
                              },
                              child: const Text(
                                "Pilih",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // ===================== TOMBOL TAMBAH AKUN ======================
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.person_add, size: 22),
                label: const Text(
                  "Tambah Akun",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange.shade700, width: 1.6),
                  foregroundColor: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: tampilkan halaman login akun baru
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
